import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/cards/data/repo/cards_repo.dart';
import 'package:flashcards/features/cards/manager/cards_list_cubit/cards_list_state.dart';
import 'package:flashcards/features/settings/data/model/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListCubit extends Cubit<CardListState> {
  final CardsRepo cardsRepo;
  CardsListCubit(this.cardsRepo) : super(CardListInitial());

  late CollectionModel setModel;
  late SettingsModel settingsModel;
  List<CardModel> cardsList = [];
  List<CardModel> filteredCardsList = [];
  initSetModel(Map<String, dynamic> data) {
    setModel = data['collectionModel'] as CollectionModel;
    settingsModel = data['settingsModel'] as SettingsModel;
  }

  editSetModel(CollectionModel collection) {
    setModel = collection;
    emit(CardListSetEdited());
  }

  Future fetchCards() async {
    emit(CardListLoading());
    cardsList = await cardsRepo.fetchCards(setModel.setId!);
    emit(CardListSuccess());
  }

  Future filterCardsBySettings() async {
    filteredCardsList =
        await cardsRepo.filterCardsBySettings(setModel.setId!, settingsModel);
  }

  Future refreshCardsList() async {
    await Future.wait([
      filterCardsBySettings(),
      fetchCards(),
    ]);
  }

  Future insertAnewCard(CardModel cards) async {
    int result = await cardsRepo.insertAnewCard(cards);
    if (result > 0) {
      debugPrint('----------successfully inserted------------');
      fetchCards();
    } else {
      debugPrint('----------error while inserting------------');
    }
    return result;
  }

  Future deleteCards(List<int> cardsIds) async {
    int result = await cardsRepo.deleteCards(cardsIds);
    if (result > 0) {
      debugPrint('----------successfully deleted------------');
    } else {
      debugPrint('----------error while deleting------------');
    }
    return result;
  }

  Future updateIsStudiedCard(int cardId, bool isStudied) async {
    int result = await cardsRepo.updateIsStudiedCard(cardId, isStudied);
    if (result > 0) {
      debugPrint('----------successfully updated------------');
    } else {
      debugPrint('----------error while updating------------');
    }
    return result;
  }

  Future updateForgottenCardNumber(int cardId, int numberOfForget) async {
    int result =
        await cardsRepo.updateForgottenCardNumber(cardId, numberOfForget);
    if (result > 0) {
      debugPrint('----------successfully updated------------');
    } else {
      debugPrint('----------error while updating------------');
    }
    return result;
  }
}
