import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:cardy/core/helper/db_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cardy/core/widgets/show_app_toast.dart';
import 'package:cardy/features/settings/data/repo/settings_repo.dart';
import 'package:cardy/features/settings/data/model/settings_model.dart';

class SettingsRepoImpl extends DbHelper implements SettingsRepo {
  @override
  Future<SettingsModel> fetchSettings() async {
    List<SettingsModel> settingsList = [];
    var dataList = await inquiry('SELECT * FROM settings');
    for (var e in dataList) {
      settingsList.add(SettingsModel.fromSql(e));
    }
    return settingsList[0];
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

//backup database to local storage
  @override
  Future<void> backupDatabase() async {
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, 'flash_cards.db');
    File dbFile = File(dbPath);

    if (await dbFile.exists()) {
      try {
        Uint8List dbBytes = await dbFile.readAsBytes();

        // Generate a timestamp like "2026-06-02_14-30-00"
        String timestamp = DateTime.now().toString().split(' ')[0];

        String? outputFile = await FilePicker.saveFile(
          dialogTitle: 'Save Database Backup',
          fileName: 'flash_cards_backup_$timestamp.db',
          bytes: dbBytes,
        );

        if (outputFile != null) {
          await showAppToast("Backed up successfully");
          debugPrint('Database backed up to: $outputFile');
        } else {
          await showAppToast("Backup cancelled.");
          debugPrint('Backup cancelled.');
        }
      } catch (e) {
        debugPrint('Error backing up database: $e');
        await showAppToast("Error during backup");
      }
    } else {
      await showAppToast("No database found to backup.");
    }
  }

  @override
  Future<void> restoreDatabase() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        dialogTitle: 'Select Database Backup',
        type: FileType.any,
      );

      if (result != null && result.files.single.path != null) {
        String databasePath = await getDatabasesPath();
        String dbPath = join(databasePath, 'flash_cards.db');

        File sourceFile = File(result.files.single.path!);
        File targetFile = File(dbPath);

        await sourceFile.copy(targetFile.path);

        await showAppToast("Successfully restored");
        debugPrint('Database restored from: ${result.files.single.path}');
      } else {
        await showAppToast("Restore cancelled.");
        debugPrint('Restore cancelled.');
      }
    } catch (e) {
      debugPrint('Error restoring database: $e');
      await showAppToast("Error restoring database");
    }
  }
}
