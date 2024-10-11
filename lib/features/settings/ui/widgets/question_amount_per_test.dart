import 'package:flashcards/core/theme/colors.dart';
import 'package:flutter/material.dart';

class QuestionAmountPerTest extends StatelessWidget {
  const QuestionAmountPerTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: const Text('Question amount per test'),
      subtitle: const Text('10 questions'),
      subtitleTextStyle: const TextStyle(color: AppColors.greyLight),
    );
  }
}
