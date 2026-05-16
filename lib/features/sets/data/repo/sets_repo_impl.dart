import 'package:cardy/core/helper/db_helper.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/features/sets/data/repo/sets_repo.dart';
import 'package:flutter/material.dart';

class SetsRepoImpl extends DbHelper implements SetsRepo {
  @override
  Future<List<SetModel>> fetchAllSets(folderId) async {
    List<SetModel> setsList = [];
    String sql = '''
  SELECT
    set_id,
    set_title,
    set_desc,
    set_color,
    set_icon,
    folder_id,
    (
      SELECT COUNT(*) FROM cards WHERE cards.set_id = sets.set_id
    ) as num_of_cards,
    created_at
  FROM
    sets
  WHERE
    folder_id = $folderId
''';
    var dataMap = await inquiry(sql);
    for (var e in dataMap) {
      setsList.add(SetModel.fromSql(e));
    }
    return setsList;
  }

  @override
  Future<int> insertAnewSet(setModel) async {
    String sql = '''
    INSERT INTO sets(set_title, set_desc, set_color, set_icon, folder_id)
    VALUES (?, ?, ?, ?, ?)
   ''';
    List<dynamic> arguments = [
      setModel.title,
      setModel.description,
      setModel.color.value.toRadixString(16).padLeft(8, '0'),
      setModel.icon,
      setModel.folderId,
    ];
    int result = await insert(sql, arguments);
    return result;
  }

  @override
  Future<int> deleteASet(setId) async {
    String cardSql = 'DELETE FROM cards WHERE set_id = ?';
    await delete(cardSql, [setId]);
    String setSql = 'DELETE FROM sets WHERE set_id = ?';
    int result = await delete(setSql, [setId]);
    return result;
  }

  @override
  Future<int> updateFolder(folder) async {
    String sql =
        'UPDATE folders SET  folder_title = ?, folder_desc = ?, folder_color = ? WHERE folder_id = ?';
    List<dynamic> arguments = [
      folder.title,
      folder.description,
      folder.color.value.toRadixString(16).padLeft(8, '0'),
      folder.id,
    ];
    try {
      int result = await update(sql, arguments);
      return result;
    } catch (e) {
      // Handle the error (log it, rethrow, etc.)
      debugPrint('Error updating folder: $e');
      rethrow; // Rethrow the exception if you don't want to handle it here
    }
  }
}
