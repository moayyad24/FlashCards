abstract class SelectInListEvent {}

class AddToSelectedListEvent extends SelectInListEvent {
  final int card;
  AddToSelectedListEvent({required this.card});
}

class EndSelectingEvent extends SelectInListEvent {}

