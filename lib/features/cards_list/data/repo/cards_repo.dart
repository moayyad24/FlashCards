import 'package:flashcards/core/models/card_model.dart';

abstract class CardsRepo {
  Future<List<CardModel>> fetchCards(int setId);
  Future<int> insertAnewCard(CardModel cardModel);
  Future<int> updateCard(CardModel cards);
  Future<int> deleteCards(List<int> cardsIds);
}
