import 'package:flashcards/features/cards/data/models/card_model.dart';

abstract class SelectInListEvent {}

class AddToSelectedListEvent extends SelectInListEvent {
  final CardModel card;
  AddToSelectedListEvent({required this.card});
}

class EndSelectingEvent extends SelectInListEvent {}

class StartDeletingEvent extends SelectInListEvent {}

class EndDeletingEvent extends SelectInListEvent {}
