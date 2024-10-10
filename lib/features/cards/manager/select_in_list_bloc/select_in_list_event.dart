abstract class SelectInListEvent {}

class AddToSelectedListEvent extends SelectInListEvent {
  final int cards;
  AddToSelectedListEvent({required this.cards});
}

class EndSelectingEvent extends SelectInListEvent {}
