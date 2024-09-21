import 'package:flashcards/features/cards/data/models/card_model.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_event.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectInListBloc extends Bloc<SelectInListEvent, SelectInListState> {
  List<CardModel> selectedCardList = [];
  SelectInListBloc() : super(SelectInListInitial()) {
    on<AddToSelectedListEvent>((event, emit) {
      if (selectedCardList.length == 1 &&
          selectedCardList.contains(event.card)) {
        selectedCardList.remove(event.card);
        emit(EndSelectingState());
      } else if (selectedCardList.contains(event.card)) {
        selectedCardList.remove(event.card);
        emit(StartSelectingState());
      } else {
        selectedCardList.add(event.card);
        emit(StartSelectingState());
      }
    });
    on<EndSelectingEvent>((event, emit) {
      emit(EndSelectingState());
    });
    on<StartDeletingEvent>((event, emit) {
      emit(StartDeletingState());
    });
    on<EndDeletingEvent>((event, emit) {
      emit(EndDeletingState());
    });
  }
}
