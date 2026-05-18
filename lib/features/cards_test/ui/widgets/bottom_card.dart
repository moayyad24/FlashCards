import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class BottomCardWidget extends StatelessWidget {
  final CardModel card;
  const BottomCardWidget({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            card.answer,
            style: AppTextStyles.bold20,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            card.supplementAnswer,
            style: AppTextStyles.medium18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
