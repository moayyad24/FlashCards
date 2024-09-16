import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/home/data/repo/home_repo.dart';
import 'package:flashcards/features/home/manager/home_cubit/home_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());
  homeFetchDate() async {
    emit(HomeFetchLoading());
    try {
      List<CollectionModel> homeDataList = await homeRepo.fetchHomeData();
      emit(HomeFetchSuccess(homeDataList: homeDataList));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  insertAnewSet(setModel) async {
    try {
      await homeRepo.insertAnewSet(setModel);
      await homeFetchDate();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  insertAnewFolder(folderModel) async {
    try {
      await homeRepo.insertAnewFolder(folderModel);
      await homeFetchDate();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
