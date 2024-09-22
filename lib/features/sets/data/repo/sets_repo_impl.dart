import 'package:flashcards/core/helper/db_helper.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/sets/data/repo/sets_repo.dart';

class SetsRepoImpl extends DbHelper implements SetsRepo {
  @override
  Future<List<CollectionModel>> fetchAllSets(folderId) async {
    List<CollectionModel> setsList = [];
    String sql = '''
  SELECT 
    set_title AS title, 
    set_id AS set_id, 
    set_desc AS description, 
    folder_id AS id, 
    created_at AS created_at 
  FROM 
    sets 
  WHERE 
    folder_id = $folderId
''';
    var dataMap = await inquiry(sql);
    for (var e in dataMap) {
      setsList.add(CollectionModel.fromSql(e));
    }
    return setsList;
  }

  @override
  Future<int> insertAnewSet(setModel) async {
    String sql = '''
    INSERT INTO sets(set_title, set_desc, folder_id)
    VALUES (?, ?, ?)
   ''';
    List<dynamic> arguments = [
      setModel.title,
      setModel.description,
      setModel.folderId,
    ];
    int result = await insert(sql, arguments);
    return result;
  }
}
