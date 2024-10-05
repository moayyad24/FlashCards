import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/core/widgets/custom_button.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards_test/ui/widgets/range_pointer.dart';
import 'package:flashcards/features/cards_test/ui/widgets/result_card_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestResult extends StatelessWidget {
  final int numberOfCorrectAnswer;
  final int numberOfQuestions;
  const TestResult({
    super.key,
    required this.numberOfCorrectAnswer,
    required this.numberOfQuestions,
  });
  String evaluatePerformance(int totalQuestions, int correctAnswers) {
    // Guard clause for invalid input
    if (totalQuestions <= 0) {
      return "Invalid number of questions.";
    }

    // Calculate the score percentage
    double scorePercentage = (correctAnswers / totalQuestions) * 100;

    // Determine the message based on the score percentage
    if (scorePercentage >= 80) {
      return "Great job!";
    } else if (scorePercentage >= 60) {
      return "Good effort, keep it up!";
    } else if (scorePercentage >= 40) {
      return "You can do better!";
    } else {
      return "Study hard!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyRangePointer(
          numberOfCorrectAnswer: numberOfCorrectAnswer,
          numberOfQuestions: numberOfQuestions,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            evaluatePerformance(numberOfQuestions, numberOfCorrectAnswer),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              onPressed: () {},
              title: 'Back',
              backgroundColor: AppColors.grey,
            ),
            CustomButton(
              onPressed: () {},
              title: 'Continue',
              backgroundColor: AppColors.cornflowerBlue,
            ),
          ],
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: context.read<CardListCubit>().cardList.length,
            itemBuilder: (context, index) {
              return ResultCardListTile(
                cardModel: context.read<CardListCubit>().cardList[index],
              );
            }),
      ],
    );
  }
}
