abstract class OnboardingRepo {
  Future<void> savePlanFrequency(String frequency);
  String getPlanFrequency();
  Future<void> savePlanGoal(String goal);
  String? getPlanGoal();
  Future<void> saveOnboardingCompleted(bool completed);
  bool isOnboardingCompleted();
}
