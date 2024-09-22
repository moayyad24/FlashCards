import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/sets/data/repo/sets_repo.dart';
import 'package:flashcards/features/sets/manager/sets_cubit/sets_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetsCubit extends Cubit<SetsState> {
  final SetsRepo setsRepo;
  SetsCubit(this.setsRepo) : super(SetsInitial());

  Future fetchAllSets(int folderId) async {
    emit(SetsLoading());
    try {
      List<CollectionModel> setsList = await setsRepo.fetchAllSets(folderId);
      emit(SetsSuccess(setsList: setsList));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future insertAnewSet(CollectionModel setModel) async {
    try {
      int result = await setsRepo.insertAnewSet(setModel);
      await fetchAllSets(setModel.folderId!);
      if (result > 0) {
        debugPrint('----------successfully inserted------------');
      } else {
        debugPrint('----------error while inserted------------');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
