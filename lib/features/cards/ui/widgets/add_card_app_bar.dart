import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';

AppBar addCardAppBar(
  BuildContext context,
) {
  return AppBar(
    title: Text(
      'New Card',
      style: AppTextStyles.bold22.copyWith(color: AppColors.blueADC6FF),
    ),
    titleTextStyle: const TextStyle(fontSize: 24),
  );
}
