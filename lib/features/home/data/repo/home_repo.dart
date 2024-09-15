import 'package:flashcards/features/home/data/model/home_data_model.dart';

abstract class HomeRepo {
  Future<List<HomeDataModel>> fetchHomeData();
  Future<int> insertAnewSet(HomeDataModel setModel);
  Future<int> insertAnewFolder(HomeDataModel folderModel);
}
