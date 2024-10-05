import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards_test/ui/widgets/is_correct_answer_animated_opacity.dart';
import 'package:flashcards/features/cards_test/ui/widgets/my_card.dart';
import 'package:flashcards/features/cards_test/ui/widgets/test_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsTestBody extends StatefulWidget {
  const CardsTestBody({super.key});

  @override
  State<CardsTestBody> createState() => _CardsTestBodyState();
}

class _CardsTestBodyState extends State<CardsTestBody> {
  List<CardModel> cardsList = [];
  late CardListCubit cardListCubit;
  int currentIndex = 0;
  int isCorrectAnswer = 0;
  int numberOfCorrectAnswer = 0;
  @override
  void initState() {
    cardsList = context.read<CardListCubit>().cardList;
    cardListCubit = context.read<CardListCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: _transitionBuilder,
      child: (currentIndex >= cardsList.length)
          ? TestResult(
              numberOfCorrectAnswer: numberOfCorrectAnswer,
              numberOfQuestions: cardsList.length,
            )
          : Dismissible(
              key: ValueKey(currentIndex),
              onUpdate: _onUpdate,
              onDismissed: _onDismissed,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 40),
                  MyCard(card: cardsList[currentIndex]),
                  const SizedBox(height: 30),
                  IsCorrectAnswerAnimatedOpacity(
                    opacity: isCorrectAnswer > 0 ? 1.0 : 0.0,
                    isCorrectAnswer: isCorrectAnswer,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
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

  void _onDismissed(direction) async {
    if (isCorrectAnswer == 1) {
      numberOfCorrectAnswer++;
      await cardListCubit.updateIsStudiedCard(
          cardsList[currentIndex].id!, true);
    } else if (isCorrectAnswer == 2) {
      await cardListCubit.updateIsStudiedCard(
          cardsList[currentIndex].id!, false);
    }
    if (currentIndex <= cardsList.length) {
      setState(() {
        isCorrectAnswer = 0;
        currentIndex++;
      });
    }
    if (currentIndex == cardsList.length) {
      await cardListCubit.fetchCards();
    }
  }

  void _onUpdate(details) {
    if (details.direction == DismissDirection.startToEnd) {
      isCorrectAnswer != 1
          ? setState(() {
              isCorrectAnswer = 1;
            })
          : null;
    } else if (details.direction == DismissDirection.endToStart) {
      isCorrectAnswer != 2
          ? setState(() {
              isCorrectAnswer = 2;
            })
          : null;
    }
  }
}
