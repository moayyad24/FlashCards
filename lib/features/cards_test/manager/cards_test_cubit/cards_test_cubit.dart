import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:flashcards/features/cards_test/manager/cards_test_cubit/cards_test_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsTestCubit extends Cubit<CardsTestState> {
  CardsTestCubit() : super(CardsTestInitial());

  late List<CardModel> cardsList;
  late CardsListCubit cardsListCubit;
  int currentIndex = 0;
  int isCorrectAnswer = 0;
  int numberOfCorrectAnswer = 0;
  void initState(CardsListCubit cards) {
    cardsListCubit = cards;
    cardsList = cardsListCubit.filteredCardsList;
  }

  void onDismissed(direction) async {
    await checkIfItsCorrectAnswer();
    incrementTheCurrentIndex();
    await refreshTheCardsList();
  }

  void onUpdate(details) {
    int updatedAnswer;

    switch (details.direction) {
      case DismissDirection.startToEnd:
        updatedAnswer = 1;
        break;
      case DismissDirection.endToStart:
        updatedAnswer = 2;
        break;
      default:
        return;
    }
    if (isCorrectAnswer != updatedAnswer) {
      isCorrectAnswer = updatedAnswer;
      emit(CardsTestOnUpdate());
    }
  }

  Future<void> checkIfItsCorrectAnswer() async {
    final cardId = cardsList[currentIndex].id!;
    int numberOfForget = cardsList[currentIndex].numberOfForgets!;
    switch (isCorrectAnswer) {
      case 1:
        numberOfCorrectAnswer++;
        await markCardAsStudied(cardId, true);
        await incrementForgettingNumber(cardId, 0);
        break;
      case 2:
        await markCardAsStudied(cardId, false);
        numberOfForget++;
        await incrementForgettingNumber(cardId, numberOfForget);
        break;
    }
  }

  Future<void> markCardAsStudied(int cardId, bool isStudied) async {
    await cardsListCubit.updateIsStudiedCard(cardId, isStudied);
  }

  Future<void> incrementForgettingNumber(int cardId, int numberOfForget) async {
    await cardsListCubit.updateForgottenCardNumber(cardId, numberOfForget);
  }

  void incrementTheCurrentIndex() {
    if (currentIndex < cardsList.length) {
      isCorrectAnswer = 0;
      currentIndex++;
      emit(CardsTestOnDismissed());
    }
  }

  Future<void> refreshTheCardsList() async {
    if (currentIndex == cardsList.length) {
      await cardsListCubit.refreshCardsList();
      emit(CardsTestFinish());
    }
  }

  Widget transitionBuilder(Widget child, Animation<double> animation) {
    final curvedAnimation =
        CurvedAnimation(parent: animation, curve: Curves.easeInOut);
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ).animate(curvedAnimation),
      child: child,
    );
  }
}
