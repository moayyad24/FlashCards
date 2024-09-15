import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

mixin DbHelper {
  static Database? _db;
  Future<Database?> get getInstance async {
    if (_db == null) {
      _db = await instance();
      return _db;
    } else {
      return _db;
    }
  }

  final String _sqlTableFolders = '''
    CREATE TABLE folders (
    folder_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    folder_title TEXT NOT NULL,
    folder_desc  TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );
''';

  final String _sqlTableSets = '''
    CREATE TABLE sets (
        set_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        set_title TEXT NOT NULL,
        set_desc TEXT NOT NULL,
        folder_id INTEGER NOT NULL DEFAULT 0,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (folder_id) REFERENCES folders(folder_id)
    );
'''; //if folder_id is 0 then it not related to any folder

  final String _sqlTableCard = '''
    CREATE TABLE card (
        card_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        card_question TEXT NOT NULL,
        card_s_question TEXT,
        card_answer TEXT,
        card_s_answer TEXT,
        set_id INTEGER NOT NULL,  
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (set_id) REFERENCES sets(set_id)
    ); 
''';

  Future<Database?> instance() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'flash_cards.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(_sqlTableFolders);
      await db.execute(_sqlTableSets);
      await db.execute(_sqlTableCard);
      debugPrint('Text Database has been created');
    });

    return database;
  }

  inquiry(String sqlTxt) async {
    Database? db = await getInstance;
    // Get the records
    List<Map> list = await db!.rawQuery(sqlTxt);
    return list;
  }

  insert(String sqlTxt) async {
    Database? db = await getInstance;
    // Insert some record
    int count = await db!.rawInsert(sqlTxt);
    return count;
  }

  update(String sqlTxt) async {
    Database? db = await getInstance;
    // Update some record
    int count = await db!.rawUpdate(sqlTxt);
    return count;
  }

  delete(String sqlTxt) async {
    Database? db = await getInstance;
    // Delete some record
    int count = await db!.rawDelete(sqlTxt);
    return count;
  }
}
