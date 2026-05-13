import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/features/cards/data/repo/cards_repo.dart';
import 'package:cardy/features/cards/manager/edit_set_cubit/edit_set_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSetCubit extends Cubit<EditSetState> {
  final CardsRepo cardsRepo;
  EditSetCubit(this.cardsRepo) : super(EditSetInitial());
  updateSet(SetModel setModel) async {
    emit(EditSetLoading());
    await cardsRepo.updateSet(setModel);
    emit(EditSetSuccess());
  }
}
