import 'package:flashcards/features/home/data/model/home_data_model.dart';
import 'package:flashcards/features/home/data/model/set_model.dart';

abstract class HomeRepo {
  Future<List<HomeDataModel>> fetchHomeData();
  Future<int> insertAnewSet(SetModel setModel);
}
