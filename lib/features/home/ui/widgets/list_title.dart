import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onViewAllPressed;
  const ListTitle({
    super.key,
    required this.title,
    required this.icon,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0).r,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.orangeFFB786,
          ),
          10.horizontalSpace,
          Text(
            title,
            style: AppTextStyles.bold20,
          ),
          //TODO: Implemnt this
          // const Spacer(),
          // TextButton(
          //   onPressed: onViewAllPressed,
          //   child: Text(
          //     'View All',
          //     style: AppTextStyles.bold16.copyWith(color: AppColors.blueADC6FF),
          //   ),
          // )
        ],
      ),
    );
  }
}
