import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyPlaceholder extends StatelessWidget {
  const EmptyPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 120).r,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20).r,
          padding: const EdgeInsets.all(20).r,
          decoration: const BoxDecoration(
              color: AppColors.grey1D2127,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/app_logo.png',
                width: 120.w,
                height: 120.w,
              ),
              10.verticalSpace,
              Text(
                'Start your learning journey!',
                style: AppTextStyles.bold26,
                textAlign: TextAlign.center,
              ),
              10.verticalSpace,
              Text(
                'Looks like you don\'t have any flashcards yet. Create your first folder or set to begin!',
                style: AppTextStyles.medium16
                    .copyWith(color: AppColors.greyC2C6D6),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
