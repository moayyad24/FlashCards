import 'package:cardy/core/cubits/ads_cubit/ads_cubit.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/widgets/custom_button.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards_test/manager/cards_test_cubit/cards_test_cubit.dart';
import 'package:cardy/features/cards_test/ui/widgets/range_pointer.dart';
import 'package:cardy/features/cards_test/ui/widgets/result_card_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestResultScreen extends StatelessWidget {
  const TestResultScreen({
    super.key,
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
    context.read<AdsCubit>().showInterstitialAd();
    return Scaffold(
      body: ListView(
        children: [
          MyRangePointer(
            numberOfCorrectAnswer:
                context.read<CardsTestCubit>().numberOfCorrectAnswer,
            numberOfQuestions: context.read<CardsTestCubit>().cardsList.length,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              evaluatePerformance(
                context.read<CardsTestCubit>().cardsList.length,
                context.read<CardsTestCubit>().numberOfCorrectAnswer,
              ),
              style: AppTextStyles.bold22,
            ),
          ),
          25.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'Back',
                  backgroundColor: AppColors.grey20232A,
                ),
                12.horizontalSpace,
                CustomButton(
                  onPressed: () {
                    context
                        .read<CardsTestCubit>()
                        .refreshTheCardsListAfterTest();
                  },
                  title: 'Continue',
                  backgroundColor: AppColors.blue002E6A,
                ),
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  context.read<CardsListCubit>().filteredCardsList.length,
              itemBuilder: (context, index) {
                return ResultCardListTile(
                  cardModel:
                      context.read<CardsListCubit>().filteredCardsList[index],
                );
              }),
          16.verticalSpace,
        ],
      ),
    );
  }
}
