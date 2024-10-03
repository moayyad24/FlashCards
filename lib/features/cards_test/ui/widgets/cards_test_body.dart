import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards_test/ui/widgets/is_correct_answer_animated_opacity.dart';
import 'package:flashcards/features/cards_test/ui/widgets/my_card.dart';
import 'package:flashcards/features/cards_test/ui/widgets/test_result.dart';
import 'package:flutter/material.dart';

class CardsTestBody extends StatefulWidget {
  final List<CardModel> cardsList;
  const CardsTestBody({super.key, required this.cardsList});

  @override
  State<CardsTestBody> createState() => _CardsTestBodyState();
}

class _CardsTestBodyState extends State<CardsTestBody> {
  int currentIndex = 0;
  int isCorrectAnswer = 0;
  int numberOfCorrectAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: _transitionBuilder,
      child: (currentIndex >= widget.cardsList.length)
          ? TestResult(
              numberOfCorrectAnswer: numberOfCorrectAnswer,
              numberOfQuestions: widget.cardsList.length,
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
                  MyCard(card: widget.cardsList[currentIndex]),
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

  void _onDismissed(direction) {
    if (isCorrectAnswer == 1) {
      numberOfCorrectAnswer++;
    }
    if (currentIndex <= widget.cardsList.length) {
      setState(() {
        isCorrectAnswer = 0;
        currentIndex++;
      });
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
