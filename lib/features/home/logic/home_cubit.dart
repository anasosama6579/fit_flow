import 'package:fit_flow/core/helper/date_helper.dart';
import 'package:fit_flow/features/home/domain/repos/workout_repo.dart';
import 'package:fit_flow/features/home/logic/home_state.dart';
import 'package:fit_flow/features/onboarding/domain/onboarding_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final WorkoutRepo _workoutRepo;
  final OnboardingRepo _onboardingRepo;

  HomeCubit(this._workoutRepo, this._onboardingRepo) : super(HomeInitial());

  Future<void> fetchWorkoutPlan() async {
    emit(HomeLoading());

    try {
      final String? goal = _onboardingRepo.getPlanGoal();
      final String frequency = _onboardingRepo.getPlanFrequency();

      if (goal == null || goal.isEmpty) {
        emit(HomeFailure("Goal is not set. Please complete onboarding."));
        return;
      }

      final workoutPlan = await _workoutRepo.getWorkoutPlan(goal, frequency);

      if (workoutPlan != null) {
        final currentWorkoutDayIndex = DateHelper.getWorkoutDayIndex();
        final weekDays = DateHelper.getCurrentWeekDays();
        emit(HomeSuccess(workoutPlan, currentWorkoutDayIndex, weekDays));
      } else {
        emit(
          HomeFailure("No workout plan found for your selected preferences."),
        );
      }
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> checkWorkoutUpdates() async {
    final bool updated = await _workoutRepo.isUpdated();
    if (updated) {
      fetchWorkoutPlan();
    }
  }

  Future<void> startWorkout() async {
    if (state is HomeSuccess) {
      final currentState = state as HomeSuccess;

      // Update week days list (set today's isProgressed to true)
      List<Map<String, dynamic>> weekDays = List.from(currentState.weekDays);
      DateTime now = DateTime.now();
      for (var dayData in weekDays) {
        if (dayData['day'] == now.day) {
          dayData['isProgressed'] = true;
          break;
        }
      }
      await DateHelper.saveWeekDays(weekDays);

      // Update workout day index
      int newIndex = currentState.currentWorkoutDayIndex + 1;
      if (newIndex >= currentState.workoutPlan.days.length) {
        newIndex = 0; // Wrap around if we completed all days
      }
      await DateHelper.saveWorkoutDayIndex(newIndex);

      emit(HomeSuccess(currentState.workoutPlan, newIndex, weekDays));
    }
  }
}
