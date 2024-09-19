import 'package:flashcards/features/cards/data/models/card_model.dart';
import 'package:flashcards/features/cards/data/repo/cards_repo.dart';
import 'package:flashcards/features/cards/manager/card_list_cubit/card_list_state.dart';
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
}
