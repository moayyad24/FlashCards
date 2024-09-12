import 'package:flashcards/features/home/data/model/set_model.dart';

abstract class HomeRepo {
  Future<List<SetModel>> fetchAllSets();
  Future<int> insertAnewSet(SetModel setModel);
}
