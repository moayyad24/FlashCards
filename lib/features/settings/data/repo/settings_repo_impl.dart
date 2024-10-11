import 'package:flashcards/core/helper/db_helper.dart';
import 'package:flashcards/features/settings/data/repo/settings_repo.dart';
import 'package:flutter/foundation.dart';

class SettingsRepoImpl extends DbHelper implements SettingsRepo {
  @override
  Future<int> updatePrioritizing(isRandomization) async {
    String sql = 'UPDATE settings SET randomization = ?';
    List<dynamic> arguments = [
      isRandomization ? 1 : 0,
    ];
    try {
      int result = await update(sql, arguments);
      return result;
    } catch (e) {
      debugPrint('Error updating cards: $e');
      rethrow;
    }
  }

  @override
  Future<int> updateRandomization(isPrioritizing) async {
    String sql = 'UPDATE settings SET prioritizing = ?';
    List<dynamic> arguments = [
      isPrioritizing ? 1 : 0,
    ];
    try {
      int result = await update(sql, arguments);
      return result;
    } catch (e) {
      debugPrint('Error updating cards: $e');
      rethrow;
    }
  }

  @override
  Future<int> updateQuestionAmount(numOfQuestions) async {
    String sql = 'UPDATE settings SET question_amount = ?';
    try {
      int result = await update(sql, [numOfQuestions]);
      return result;
    } catch (e) {
      debugPrint('Error updating cards: $e');
      rethrow;
    }
  }
}
