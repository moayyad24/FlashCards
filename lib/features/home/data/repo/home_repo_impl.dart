import 'package:flashcards/core/helper/db_helper.dart';
import 'package:flashcards/features/home/data/model/set_model.dart';
import 'package:flashcards/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo with DbHelper {
  @override
  Future<List<SetModel>> fetchAllSets() async {
    List<SetModel> setsList = [];
    String sql = "SELECT * FROM sets ORDER BY set_id DESC;";
    var setsMap = await inquiry(sql);
    for (var e in setsMap) {
      setsList.add(SetModel.fromSql(e));
    }
    return setsList;
  }

  @override
  Future<int> insertAnewSet(setModel) async {
    String sql = '''
   INSERT INTO sets(set_title, set_desc)
   VALUES ('${setModel.title}', '${setModel.description}')
   ''';
    int result = await insert(sql);
    return result;
  }
}
