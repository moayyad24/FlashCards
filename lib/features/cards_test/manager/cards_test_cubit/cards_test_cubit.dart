import 'dart:async';

import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards_test/manager/cards_test_cubit/cards_test_state.dart';
import 'package:cardy/features/cards_test/models/answer_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsTestCubit extends Cubit<CardsTestState> {
  CardsTestCubit() : super(CardsTestInitial());

  late List<CardModel> cardsList;
  late CardsListCubit cardsListCubit;
  int currentIndex = 0;
  AnswerStatus answerStatus = AnswerStatus.none;
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

  Future<void> onAnswerPressed(AnswerStatus status) async {
    if (answerStatus != status) {
      answerStatus = status;
      emit(CardsTestOnUpdate());
    }
    await checkIfItsCorrectAnswer();
    incrementTheCurrentIndex();
    await refreshTheCardsList();
  }

  void onUpdate(details) {
    AnswerStatus updatedAnswer;

    switch (details.direction) {
      case DismissDirection.startToEnd:
        updatedAnswer = AnswerStatus.correct;
        break;
      case DismissDirection.endToStart:
        updatedAnswer = AnswerStatus.incorrect;
        break;
      default:
        return;
    }
    if (answerStatus != updatedAnswer) {
      answerStatus = updatedAnswer;
      emit(CardsTestOnUpdate());
    }
  }

  Future<void> checkIfItsCorrectAnswer() async {
    final cardId = cardsList[currentIndex].id!;
    int numberOfForget = cardsList[currentIndex].numberOfForgets!;
    switch (answerStatus) {
      case AnswerStatus.correct:
        numberOfCorrectAnswer++;
        await markCardAsStudied(cardId, true);
        await incrementForgettingNumber(cardId, 0);
        break;
      case AnswerStatus.incorrect:
        await markCardAsStudied(cardId, false);
        numberOfForget++;
        await incrementForgettingNumber(cardId, numberOfForget);
        break;
      case AnswerStatus.none:
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
      answerStatus = AnswerStatus.none;
      currentIndex++;
      emit(CardsTestOnDismissed());
    }
  }

  Future<void> refreshTheCardsList() async {
    if (currentIndex == cardsList.length) {
      currentIndex = 0;
      await cardsListCubit.refreshCardsList();
      emit(CardsTestFinish());
    }
  }

  Future<void> refreshTheCardsListAfterTest() async {
    currentIndex = 0;
    numberOfCorrectAnswer = 0;
    await cardsListCubit.refreshCardsList();
    emit(CardsTestTakeAnewTest());
  }

  Widget transitionBuilder(Widget child, Animation<double> animation) {
    final curvedAnimation =
        CurvedAnimation(parent: animation, curve: Curves.easeInOut);
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ).animate(curvedAnimation),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: child,
      ),
    );
  }
}
