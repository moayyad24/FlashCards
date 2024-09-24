import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards_list/data/repo/cards_repo.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListCubit extends Cubit<CardListState> {
  CardsRepo cardsRepo;
  CardListCubit(this.cardsRepo) : super(CardListInitial());
  fetchCards(int setId) async {
    emit(CardListLoading());
    List<CardModel> cardList = await cardsRepo.fetchCards(setId);
    emit(CardListSuccess(cardList: cardList));
  }

  insertAnewCard(CardModel card) async {
    int result = await cardsRepo.insertAnewCard(card);
    if (result > 0) {
      debugPrint('----------successfully inserted------------');
      fetchCards(card.setId!);
    } else {
      debugPrint('----------error while inserted------------');
    }
    return result;
  }

  deleteCards(List<int> cardsIds) async {
    int result = await cardsRepo.deleteCards(cardsIds);
    if (result > 0) {
      debugPrint('----------successfully deleting------------');
    } else {
      debugPrint('----------error while deleting------------');
    }
    return result;
  }
}
