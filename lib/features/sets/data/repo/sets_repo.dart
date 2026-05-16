import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/models/set_model.dart';

abstract class SetsRepo {
  Future<List<SetModel>> fetchAllSets(int folderId);
  Future<int> insertAnewSet(SetModel setModel);
  Future<int> deleteASet(int setId);
  Future<int> updateFolder(FolderModel folder);
}
