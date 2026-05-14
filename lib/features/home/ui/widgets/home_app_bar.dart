import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Cardy',
        style: AppTextStyles.bold32.copyWith(
          color: AppColors.blueADC6FF,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Now you have access to context
            // Navigator.pushNamed(context, '/search');
          },
          style: IconButton.styleFrom(
            backgroundColor: AppColors.grey282B36,
            side: BorderSide(
              color: AppColors.border8C909F.withAlpha(90),
            ),
          ),
          icon: const Icon(Icons.search, color: AppColors.greyLightE1E2EC),
        ),
        8.horizontalSpace,
        IconButton(
          onPressed: () {
            // Now you have access to context
          },
          style: IconButton.styleFrom(
            backgroundColor: AppColors.grey282B36,
            side: BorderSide(
              color: AppColors.border8C909F.withAlpha(90),
            ),
          ),
          icon: const Icon(Icons.settings, color: AppColors.greyLightE1E2EC),
        ),
        15.horizontalSpace,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
