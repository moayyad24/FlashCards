import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/features/cards/data/repo/cards_repo.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_state.dart';
import 'package:cardy/features/settings/data/model/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListCubit extends Cubit<CardListState> {
  final CardsRepo cardsRepo;
  CardsListCubit(this.cardsRepo) : super(CardListInitial());

  late SetModel setModel;
  late SettingsModel settingsModel;
  List<CardModel> cardsList = [];
  List<CardModel> filteredCardsList = [];
  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  List<CardModel> get visibleCardsList {
    final baseList = cardsList;
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) {
      return baseList;
    }
    return baseList.where((card) {
      return card.question.toLowerCase().contains(query) ||
          card.supplementQuestion.toLowerCase().contains(query) ||
          card.answer.toLowerCase().contains(query) ||
          card.supplementAnswer.toLowerCase().contains(query);
    }).toList();
  }

  initSetModel(Map<String, dynamic> data) {
    setModel = data['setModel'] as SetModel;
    settingsModel = data['settingsModel'] as SettingsModel;
  }

  editSetModel(SetModel collection) {
    setModel = collection;
    emit(CardListSetEdited());
  }

  Future fetchCards() async {
    emit(CardListLoading());
    cardsList = await cardsRepo.fetchCards(setModel.id);
    emit(CardListSuccess());
  }

  Future filterCardsBySettings() async {
    filteredCardsList =
        await cardsRepo.filterCardsBySettings(setModel.id, settingsModel);
  }

  Future refreshCardsList() async {
    // if its not empty means that the refreshing come from cards_test
    filteredCardsList.isNotEmpty ? await filterCardsBySettings() : null;
    await fetchCards();
  }

  void updateSearchQuery(String query) {
    if (_searchQuery == query) {
      return;
    }
    _searchQuery = query;
    emit(CardListSearchUpdated());
  }

  void clearSearch() {
    if (_searchQuery.isEmpty) {
      return;
    }
    _searchQuery = '';
    emit(CardListSearchUpdated());
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
