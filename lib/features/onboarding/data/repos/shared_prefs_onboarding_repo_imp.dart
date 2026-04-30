import 'package:fit_flow/core/storage/shared_pref_helper.dart';
import 'package:fit_flow/core/storage/storage_keys.dart';
import 'package:fit_flow/features/onboarding/domain/onboarding_repo.dart';

class SharedPrefsOnboardingRepoImp implements OnboardingRepo {
  /// Save the plan frequency
  @override
  Future<void> savePlanFrequency(String frequency) async {
    await SharedPrefsHelper.saveData(
      key: StorageKeys.planFrequency,
      value: frequency,
    );
  }

  @override
  /// Get the plan frequency
  String getPlanFrequency() {
    return SharedPrefsHelper.getData(key: StorageKeys.planFrequency) ??
        '3 Days';
  }

  /// Save the plan goal
  @override
  Future<void> savePlanGoal(String goal) async {
    await SharedPrefsHelper.saveData(key: StorageKeys.planGoal, value: goal);
  }

  /// Get the plan goal
  @override
  String? getPlanGoal() {
    return SharedPrefsHelper.getData(key: StorageKeys.planGoal);
  }

  // Save onboarding completion status
  @override
  Future<void> saveOnboardingCompleted(bool completed) async {
    await SharedPrefsHelper.saveData(
      key: StorageKeys.onboardingCompleted,
      value: completed,
    );
  }

  /// Get onboarding completion status
  @override
  bool isOnboardingCompleted() {
    return SharedPrefsHelper.getData(key: StorageKeys.onboardingCompleted) ??
        false;
  }
}
