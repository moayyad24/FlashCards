import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:flashcards/core/helper/db_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flashcards/features/settings/data/repo/settings_repo.dart';
import 'package:flashcards/features/settings/data/model/settings_model.dart';

class SettingsRepoImpl extends DbHelper implements SettingsRepo {
  String backupsPath = Directory('/storage/emulated/0/Cardy/Backups').path;
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
  Future<void> copyDirectory(Directory source, Directory destination) async {
    // Create the destination directory if it doesn't exist
    if (!await destination.exists()) {
      await destination.create(recursive: true);
    }

    // Iterate over all files and directories in the source directory
    await for (var entity in source.list()) {
      if (entity is File) {
        // Copy the file to the destination
        await entity.copy(join(destination.path, basename(entity.path)));
      } else if (entity is Directory) {
        // If it's a directory, recursively copy its contents
        await copyDirectory(
            entity, Directory(join(destination.path, basename(entity.path))));
      }
    }
  }

  @override
  Future<void> backupDatabase() async {
    if (await Permission.storage.request().isGranted) {
      // Specify the source and destination directories
      String databasePath = await getDatabasesPath(); //database path

      // Create a new backup directory if it doesn't exist
      Directory(backupsPath).createSync(recursive: true);

      try {
        await copyDirectory(Directory(databasePath), Directory(backupsPath));
        debugPrint('Database backed up to: $backupsPath');
      } catch (e) {
        debugPrint('Error backing up database: $e');
      }
    } else {
      await Permission.storage.request();
      debugPrint('Storage permission is required for backup.');
    }
  }

  @override
  Future<void> restoreDatabase() async {
    if (await Permission.storage.request().isGranted) {
      // Specify the source and destination directories
      String databasePath = await getDatabasesPath(); //database path
      try {
        if (await Directory(backupsPath).exists()) {
          await copyDirectory(Directory(backupsPath), Directory(databasePath));
          debugPrint('Database backed up to: $databasePath');
        } else {
          debugPrint('No backup found.');
        }
      } catch (e) {
        debugPrint('Error backing up database: $e');
      }
    } else {
      await Permission.storage.request();
      debugPrint('Storage permission is required for backup.');
    }
  }
}
