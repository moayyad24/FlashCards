import 'package:cardy/core/models/collection_model.dart';
import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/features/sets/data/repo/sets_repo.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetsCubit extends Cubit<SetsState> {
  final SetsRepo setsRepo;
  SetsCubit(this.setsRepo) : super(SetsInitial());

  late FolderModel folderModel;
  List<SetModel> setsList = [];
  initFolderModel(FolderModel folder) {
    folderModel = folder;
  }

  editFolderModel(FolderModel folder) {
    folderModel = folder;
    emit(SetsFolderEdited());
  }

  Future fetchAllSets() async {
    emit(SetsLoading());

    try {
      setsList.clear();
      setsList = await setsRepo.fetchAllSets(folderModel.id);
      emit(SetsSuccess());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future insertAnewSet(CollectionModel setModel) async {
    try {
      int result = await setsRepo.insertAnewSet(setModel);
      await fetchAllSets();
      if (result > 0) {
        debugPrint('----------successfully inserted------------');
      } else {
        debugPrint('----------error while inserted------------');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future deleteASet(int setId, int folderId) async {
    try {
      int result = await setsRepo.deleteASet(setId);
      if (result > 0) {
        debugPrint('----------successfully deleted------------');
        await fetchAllSets();
      } else {
        debugPrint('----------error while deleted------------');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
