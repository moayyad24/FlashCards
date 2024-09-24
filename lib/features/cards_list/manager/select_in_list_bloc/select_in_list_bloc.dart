import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_event.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectInListBloc extends Bloc<SelectInListEvent, SelectInListState> {
  List<int> selectedCardIdsList = [];
  SelectInListBloc() : super(SelectInListInitial()) {
    on<AddToSelectedListEvent>((event, emit) {
      if (selectedCardIdsList.length == 1 &&
          selectedCardIdsList.contains(event.cards)) {
        selectedCardIdsList.remove(event.cards);
        emit(EndSelectingState());
      } else if (selectedCardIdsList.contains(event.cards)) {
        selectedCardIdsList.remove(event.cards);
        emit(StartSelectingState());
      } else {
        selectedCardIdsList.add(event.cards);
        emit(StartSelectingState());
      }
    });
    on<EndSelectingEvent>((event, emit) {
      emit(EndSelectingState());
    });
  }
}
