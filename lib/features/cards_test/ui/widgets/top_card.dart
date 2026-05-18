import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCardWidget extends StatelessWidget {
  final CardModel card;
  const TopCardWidget({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30).r,
        child: Column(
          children: [
            Text(
              card.question,
              style: AppTextStyles.bold20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              card.supplementQuestion,
              style: AppTextStyles.medium18,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
