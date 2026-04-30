import 'package:fit_flow/features/home/data/repos/firebase_workout_repo_imp.dart';
import 'package:fit_flow/features/home/domain/repos/workout_repo.dart';
import 'package:fit_flow/features/home/logic/home_cubit.dart';
import 'package:fit_flow/features/onboarding/data/repos/shared_prefs_onboarding_repo_imp.dart';
import 'package:fit_flow/features/onboarding/domain/onboarding_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Repositories
  getIt.registerLazySingleton<OnboardingRepo>(() => SharedPrefsOnboardingRepoImp());
  getIt.registerLazySingleton<WorkoutRepo>(() => FirebaseWorkoutRepoImp());

  // Cubits
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt(), getIt()));
}
