import 'package:flashcards/core/helper/db_helper.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo with DbHelper {
  @override
  Future<List<CollectionModel>> fetchHomeData() async {
    List<CollectionModel> homeDataList = [];
    String sql = '''
         SELECT *
         FROM (
             SELECT folder_id AS id, folder_title AS title, folder_desc AS description, created_at
             FROM folders
             UNION ALL
             SELECT folder_id AS id, set_title AS title, set_desc AS description, created_at
             FROM sets
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
}
