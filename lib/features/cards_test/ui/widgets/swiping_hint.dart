import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SwipingHint extends StatelessWidget {
  const SwipingHint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Swipe right for correct, left for wrong',
      textAlign: TextAlign.center,
      style: AppTextStyles.medium14.copyWith(color: AppColors.border8C909F),
    );
  }
}
