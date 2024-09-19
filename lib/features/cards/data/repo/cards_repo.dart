import 'package:flashcards/features/cards/data/models/card_model.dart';

abstract class CardsRepo {
  Future<List<CardModel>> fetchCards(int setId);
  Future<int> insertAnewCard(CardModel cardModel);
  Future<int> updateCard(CardModel card);
}
