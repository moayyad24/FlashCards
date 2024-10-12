import 'package:flashcards/core/helper/db_helper.dart';
import 'package:flashcards/features/settings/data/model/settings_model.dart';
import 'package:flashcards/features/settings/data/repo/settings_repo.dart';
import 'package:flutter/foundation.dart';

class SettingsRepoImpl extends DbHelper implements SettingsRepo {
  @override
  Future<SettingsModel?> fetchSettings() async {
    List<SettingsModel> settingsList = [];
    var dataList = await inquiry('SELECT * FROM settings');
    for (var e in dataList) {
      settingsList.add(SettingsModel.fromSql(e));
    }
    return settingsList.isNotEmpty ? settingsList[0] : null;
  }

  @override
  Future<int> updatePrioritizing(isPrioritizing) async {
    String sql = 'UPDATE settings SET prioritizing = ? WHERE settings_id = 1';
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
  Future<int> updateRandomization(isRandomization) async {
    String sql = 'UPDATE settings SET randomization = ? WHERE settings_id = 1';
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
  Future<int> updateQuestionAmount(numOfQuestions) async {
    String sql =
        'UPDATE settings SET question_amount = ? WHERE settings_id = 1';
    try {
      int result = await update(sql, [numOfQuestions]);
      return result;
    } catch (e) {
      debugPrint('Error updating cards: $e');
      rethrow;
    }
  }
}
