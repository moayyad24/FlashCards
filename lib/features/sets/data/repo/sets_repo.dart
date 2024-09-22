import 'package:flashcards/core/models/collection_model.dart';

abstract class SetsRepo {
  Future<List<CollectionModel>> fetchAllSets(int folderId);
  Future<int> insertAnewSet(CollectionModel setModel);
}
