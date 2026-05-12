import 'package:cardy/features/home/data/model/home_model.dart';
import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/models/set_model.dart';

abstract class HomeRepo {
  Future<HomeModel> fetchHomeData();
  Future<int> insertAnewSet(SetModel setModel);
  Future<int> insertAnewFolder(FolderModel folderModel);
  Future<int> deleteSet(int setId);
  Future<int> deleteFolder(int folderId);
}
