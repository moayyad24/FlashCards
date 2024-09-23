import 'package:flashcards/core/models/collection_model.dart';

abstract class HomeRepo {
  Future<List<CollectionModel>> fetchHomeData();
  Future<int> insertAnewSet(CollectionModel setModel);
  Future<int> insertAnewFolder(CollectionModel folderModel);
  Future<int> deleteSet(int setId);
  Future<int> deleteFolder(int folderId);
}
