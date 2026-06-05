import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive_io.dart';
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
    try {
      Database? db = await getInstance;
      if (db != null) {
        await db.rawQuery('PRAGMA wal_checkpoint(FULL)');
      }

      String databasePath = await getDatabasesPath();
      String dbPath = join(databasePath, 'flash_cards.db');
      File dbFile = File(dbPath);

      if (await dbFile.exists()) {
        final archive = Archive();

        // Add the main db file
        final dbBytes = await dbFile.readAsBytes();
        archive.addFile(ArchiveFile('flash_cards.db', dbBytes.length, dbBytes));

        // Check for wal and shm files and add them if they exist
        final walFile = File('$dbPath-wal');
        if (await walFile.exists()) {
          final walBytes = await walFile.readAsBytes();
          archive.addFile(
              ArchiveFile('flash_cards.db-wal', walBytes.length, walBytes));
        }

        final shmFile = File('$dbPath-shm');
        if (await shmFile.exists()) {
          final shmBytes = await shmFile.readAsBytes();
          archive.addFile(
              ArchiveFile('flash_cards.db-shm', shmBytes.length, shmBytes));
        }

        final zipEncoder = ZipEncoder();
        final zipBytes = zipEncoder.encode(archive);

        String timestamp = DateTime.now()
            .toString()
            .replaceAll(' ', '_')
            .replaceAll(':', '-')
            .split('.')[0];
        final tempDir = await getTemporaryDirectory();
        final backupFilePath =
            join(tempDir.path, 'flash_cards_backup_$timestamp.zip');

        final backupFile = File(backupFilePath);
        await backupFile.writeAsBytes(zipBytes);

        await SharePlus.instance.share(
          ShareParams(
            files: [XFile(backupFile.path)],
            text: 'Flash Cards Backup',
          ),
        );
      } else {
        await showAppToast("No database found to backup.");
      }
    } catch (e) {
      debugPrint('Error backing up database: $e');
      await showAppToast("Error during backup");
    }
  }

  @override
  Future<void> restoreDatabase() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        dialogTitle: 'Select Database Backup',
        type: FileType.custom,
        allowedExtensions: ['zip', 'db'],
      );

      if (result != null && result.files.single.path != null) {
        String backupPath = result.files.single.path!;
        File backupFile = File(backupPath);

        await closeDatabase();

        String databasePath = await getDatabasesPath();
        String dbPath = join(databasePath, 'flash_cards.db');

        if (backupPath.endsWith('.zip')) {
          final bytes = await backupFile.readAsBytes();
          final archive = ZipDecoder().decodeBytes(bytes);

          for (final file in archive) {
            if (file.isFile) {
              final data = file.content as List<int>;
              final outFile = File(join(databasePath, file.name));
              await outFile.writeAsBytes(data, flush: true);
            }
          }
        } else if (backupPath.endsWith('.db')) {
          await backupFile.copy(dbPath);
        }

        // Reopen DB to ensure it works
        await getInstance;

        await showAppToast("Successfully restored");
        debugPrint('Database restored from: $backupPath');
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
