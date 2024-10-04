import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/cards_list/data/repo/cards_repo.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListCubit extends Cubit<CardListState> {
  CardsRepo cardsRepo;
  CardListCubit(this.cardsRepo) : super(CardListInitial());

  late CollectionModel setModel;
  List<CardModel> cardList = [];
  initSetModel(CollectionModel collection) {
    setModel = collection;
  }

  editSetModel(CollectionModel collection) {
    setModel = collection;
    emit(CardListSetEdited());
  }

  fetchCards() async {
    emit(CardListLoading());
    cardList.clear();
    cardList = await cardsRepo.fetchCards(setModel.setId!);
    emit(CardListSuccess());
  }

  insertAnewCard(CardModel cards) async {
    int result = await cardsRepo.insertAnewCard(cards);
    if (result > 0) {
      debugPrint('----------successfully inserted------------');
      fetchCards();
    } else {
      debugPrint('----------error while inserting------------');
    }
    return result;
  }

  deleteCards(List<int> cardsIds) async {
    int result = await cardsRepo.deleteCards(cardsIds);
    if (result > 0) {
      debugPrint('----------successfully deleted------------');
    } else {
      debugPrint('----------error while deleting------------');
    }
    return result;
  }

  updateIsStudiedCard(int cardId, bool isStudied) async {
    int result = await cardsRepo.updateIsStudiedCard(cardId, isStudied);
    if (result > 0) {
      debugPrint('----------successfully updated------------');
    } else {
      debugPrint('----------error while updating------------');
    }
    return result;
  }
}
