import 'package:flashcards/core/helper/db_helper.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends DbHelper implements HomeRepo {
  @override
  Future<List<CollectionModel>> fetchHomeData() async {
    List<CollectionModel> homeDataList = [];
    String sql = '''
         SELECT *
         FROM (
             SELECT folder_id AS id, folder_title AS title, folder_desc AS description, NULL AS set_id, created_at
             FROM folders
             UNION ALL
             SELECT folder_id AS id, set_title AS title, set_desc AS description, set_id AS set_id, created_at
             FROM sets
             WHERE folder_id = 0  -- This line ensures only sets with folder_id = 0 are selected
         ) AS combined
         ORDER BY created_at DESC;
          ''';

    var dataMap = await inquiry(sql);
    for (var e in dataMap) {
      homeDataList.add(CollectionModel.fromSql(e));
    }
    return homeDataList;
  }

  @override
  Future<int> insertAnewSet(setModel) async {
    String sql = '''
    INSERT INTO sets(set_title, set_desc)
    VALUES (?, ?)
   ''';
    List<dynamic> arguments = [
      setModel.title,
      setModel.description,
    ];
    int result = await insert(sql, arguments);
    return result;
  }

  @override
  Future<int> insertAnewFolder(folderModel) async {
    String sql = '''
    INSERT INTO folders(folder_title, folder_desc)
    VALUES (?, ?)
    ''';
    List<dynamic> arguments = [
      folderModel.title,
      folderModel.description,
    ];
    int result = await insert(sql, arguments);
    return result;
  }

  @override
  Future<int> deleteSet(int setId) async {
    String cardSql = 'DELETE FROM cards WHERE set_id = ?';
    await delete(cardSql, [setId]);
    String setSql = 'DELETE FROM sets WHERE set_id = ?';
    int result = await delete(setSql, [setId]);
    return result;
  }

  @override
  Future<int> deleteFolder(int folderId) async {
    String cardSql = '''
      WITH RECURSIVE temp_sets AS (
          SELECT set_id FROM sets WHERE folder_id = ?
      ),
      temp_cards AS (
          SELECT card_id FROM cards WHERE set_id IN (SELECT set_id FROM temp_sets)
      )
      DELETE FROM cards WHERE card_id IN (SELECT card_id FROM temp_cards);
        ''';
    String setsSql = 'DELETE FROM sets WHERE folder_id = ?';
    String folderSql = 'DELETE FROM folders WHERE folder_id = ?';
    await delete(cardSql, [folderId]);
    await delete(setsSql, [folderId]);
    int result = await delete(folderSql, [folderId]);
    return result;
  }
}
