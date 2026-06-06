import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar addCardAppBar(
  BuildContext context,
) {
  return AppBar(
    title: const Text(
      'New Card',
    ),
    titleTextStyle: TextStyle(
        color: AppColors.blueADC6FF,
        fontSize: 1.sw > 760 ? 42 : 28,
        fontWeight: FontWeight.bold),
  );
}
