import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String title;
  final String subtitle;

  const EmptyPlaceholder({
    super.key,
    this.title = 'Start your learning journey!',
    this.subtitle =
        'Looks like you don\'t have any flashcards yet. Create your first folder or set to begin!',
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
                width: 120,
                height: 120,
              ),
              10.verticalSpace,
              Text(
                title,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              10.verticalSpace,
              Text(
                subtitle,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyC2C6D6),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
