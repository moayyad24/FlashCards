import 'package:flashcards/features/cards_test/manager/cards_test_cubit/cards_test_cubit.dart';
import 'package:flashcards/features/cards_test/manager/cards_test_cubit/cards_test_state.dart';
import 'package:flashcards/features/cards_test/ui/widgets/test_result.dart';
import 'package:flashcards/features/cards_test/ui/widgets/my_card.dart';
import 'package:flashcards/core/models/card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CardsTestBody extends StatelessWidget {
  const CardsTestBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsTestCubit, CardsTestState>(
      builder: (context, state) {
        CardsTestCubit cardsTestCubit = context.read<CardsTestCubit>();
        List<CardModel> cardsList = cardsTestCubit.cardsList;
        if (state is CardsTestFinish) {
          return TestResult(
            numberOfCorrectAnswer: cardsTestCubit.numberOfCorrectAnswer,
            numberOfQuestions: cardsList.length,
          );
        } else {
          return LayoutBuilder(
            builder: (context, constraints) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: cardsTestCubit.transitionBuilder,
                child: Dismissible(
                  key: ValueKey(cardsTestCubit.currentIndex),
                  onUpdate: cardsTestCubit.onUpdate,
                  onDismissed: cardsTestCubit.onDismissed,
                  child: MyCard(card: cardsList[cardsTestCubit.currentIndex]),
                ),
              );
            },
          );
        }
      },
    );
  }
}
