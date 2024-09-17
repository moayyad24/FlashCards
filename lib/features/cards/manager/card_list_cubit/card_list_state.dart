import 'package:flashcards/features/cards/data/models/card_model.dart';

abstract class CardListState {}

class CardListInitial extends CardListState {}

class CardListLoading extends CardListState {}

class CardListSuccess extends CardListState {
  final List<CardModel> cardList;

  CardListSuccess({required this.cardList});
}
