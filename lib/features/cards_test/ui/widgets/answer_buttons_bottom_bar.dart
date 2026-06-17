import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/cards_test/manager/cards_test_cubit/cards_test_cubit.dart';
import 'package:cardy/features/cards_test/models/answer_status.dart';
import 'package:cardy/features/cards_test/ui/widgets/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerButtonsBottomBar extends StatelessWidget {
  const AnswerButtonsBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: const BoxDecoration(
        color: Color(0xff10131a),
        border:
            Border(top: BorderSide(color: AppColors.border1C1F26, width: 2)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30).r,
        child: Row(
          children: [
            Expanded(
              child: AnswerButton(
                label: 'Wrong',
                icon: Icons.cancel_outlined,
                isSelected: context.watch<CardsTestCubit>().answerStatus ==
                    AnswerStatus.incorrect,
                accentColor: Colors.red.shade900,
                onPressed: () => context
                    .read<CardsTestCubit>()
                    .onAnswerPressed(AnswerStatus.incorrect),
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: AnswerButton(
                label: 'Correct',
                icon: Icons.check_circle_outline_rounded,
                isSelected: context.watch<CardsTestCubit>().answerStatus ==
                    AnswerStatus.correct,
                accentColor: Colors.green.shade900,
                onPressed: () => context
                    .read<CardsTestCubit>()
                    .onAnswerPressed(AnswerStatus.correct),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
