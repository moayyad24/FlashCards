import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/settings/data/model/settings_model.dart';

abstract class CardsRepo {
  Future<List<CardModel>> fetchCards(int setId);
  Future<List<CardModel>> filterCardsBySettings(int setId,SettingsModel settingsModel);
  Future<int> insertAnewCard(CardModel cardModel);
  Future<int> updateCard(CardModel card);
  Future<int> deleteCards(List<int> cardsIds);
  Future<int> updateSet(CollectionModel setModel);
  Future<int> updateIsStudiedCard(int cardId, bool isStudied);
  Future<int> updateForgottenCardNumber(int cardId, int numberOfForget);
}
