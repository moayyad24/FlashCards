abstract class SettingsRepo {
  Future<int> updateRandomization(bool isRandomization);
  Future<int> updatePrioritizing(bool isPrioritizing);
  Future<int> updateQuestionAmount(int numOfQuestions);
}
