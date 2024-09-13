import 'package:flashcards/features/home/data/model/set_model.dart';
import 'package:flashcards/features/home/data/repo/home_repo.dart';
import 'package:flashcards/features/home/manager/sets_cubit.dart/sets_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetsCubit extends Cubit<SetsState> {
  final HomeRepo homeRepo;
  SetsCubit(this.homeRepo) : super(SetsInitial());

  fetchAllSets() async {
    emit(SetsLoading());
    try {
      List<SetModel> setsList = await homeRepo.fetchAllSets();
      emit(SetsSuccess(setsList: setsList));
    } catch (e) {
      debugPrint(e.toString());
      emit(SetsFailure());
    }
  }

  insertAnewSet(setModel) async {
    try {
      await homeRepo.insertAnewSet(setModel);
      await fetchAllSets();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
