import 'package:flashcards/features/settings/data/model/settings_model.dart';

abstract class SettingsRepo {
  Future<SettingsModel> fetchSettings();
  Future<int> updateRandomization(bool isRandomization);
  Future<int> updatePrioritizing(bool isPrioritizing);
  Future<int> updateQuestionAmount(int numOfQuestions);
  Future<void> backupDatabase();
  Future<void> restoreDatabase();
}
