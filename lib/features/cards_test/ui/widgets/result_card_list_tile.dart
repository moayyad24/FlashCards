import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ResultCardListTile extends StatelessWidget {
  const ResultCardListTile({
    super.key,
    required this.cardModel,
  });

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 14.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey1D2127,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border424754),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
          child: Row(
            children: [
              // Leading icon with subtle background
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.blueADC6FF.withAlpha(40),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.article_outlined,
                  size: 22,
                  color: AppColors.blueADC6FF,
                ),
              ),
              const SizedBox(width: 16),
              // Question & answer column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardModel.question,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.medium16,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cardModel.answer,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.medium15,
                    ),
                  ],
                ),
              ),
              // Checkbox (selection indicator)
              Checkbox(
                value: cardModel.isStudied,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
