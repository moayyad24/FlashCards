import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/cards/data/repo/cards_repo.dart';
import 'package:flashcards/features/cards/manager/edit_set_cubit/edit_set_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSetCubit extends Cubit<EditSetState> {
  final CardsRepo cardsRepo;
  EditSetCubit(this.cardsRepo) : super(EditSetInitial());
  updateSet(CollectionModel setModel) async {
    emit(EditSetLoading());
    await cardsRepo.updateSet(setModel);
    emit(EditSetSuccess());
  }
}
