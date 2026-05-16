import 'package:cardy/features/home/data/model/home_model.dart';
import 'package:cardy/features/home/data/repo/home_repo.dart';
import 'package:cardy/features/home/manager/home_cubit/home_state.dart';
import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());
  homeFetchData() async {
    emit(HomeFetchLoading());
    try {
      HomeModel homeDataList = await homeRepo.fetchHomeData();
      emit(HomeFetchSuccess(homeData: homeDataList));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> insertAnewSet(SetModel setModel) async {
    try {
      await homeRepo.insertAnewSet(setModel);
      await homeFetchData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> insertAnewFolder(FolderModel folderModel) async {
    try {
      await homeRepo.insertAnewFolder(folderModel);
      await homeFetchData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteSet(int setId) async {
    int result = await homeRepo.deleteSet(setId);
    if (result > 0) {
      debugPrint('----------successfully deleted------------');
      await homeFetchData();
    } else {
      debugPrint('----------error while deleting------------');
    }
  }

  deleteFolder(int folderId) async {
    int result = await homeRepo.deleteFolder(folderId);
    if (result > 0) {
      debugPrint('----------successfully deleted------------');
      await homeFetchData();
    } else {
      debugPrint('----------error while deleting------------');
    }
  }
}
