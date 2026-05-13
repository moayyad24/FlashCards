import 'package:cardy/core/helper/db_helper.dart';
import 'package:cardy/features/home/data/model/home_model.dart';
import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends DbHelper implements HomeRepo {
  @override
  Future<HomeModel> fetchHomeData() async {
    // Fetch all folders
    String foldersSql = '''
      SELECT f.folder_id, f.folder_title, f.folder_desc, f.created_at,
        (SELECT COUNT(*) FROM sets s WHERE s.folder_id = f.folder_id) as num_of_sets,
        (SELECT COUNT(*) FROM cards c WHERE c.set_id IN (SELECT set_id FROM sets s2 WHERE s2.folder_id = f.folder_id)) as num_of_cards
      FROM folders f
      ORDER BY f.created_at DESC;
    ''';
    var foldersData = await inquiry(foldersSql);
    List<FolderModel> folders =
        foldersData.map((e) => FolderModel.fromSql(e)).toList();

    // Fetch all sets that are not in any folder (folder_id = 0)
    String setsSql = '''
      SELECT s.set_id, s.set_title, s.set_desc, s.folder_id, s.created_at,
        (SELECT COUNT(*) FROM cards c WHERE c.set_id = s.set_id) as num_of_cards
      FROM sets s
      WHERE s.folder_id = 0
      ORDER BY s.created_at DESC;
    ''';
    var setsData = await inquiry(setsSql);
    List<SetModel> sets = setsData.map((e) => SetModel.fromSql(e)).toList();

    return HomeModel(folders: folders, sets: sets);
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
