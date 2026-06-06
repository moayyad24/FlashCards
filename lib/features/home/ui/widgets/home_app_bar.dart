import 'package:cardy/core/helper/routes.dart';
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
        style: TextStyle(
            color: AppColors.blueADC6FF,
            fontSize: 1.sw > 760 ? 42 : 32,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.settingsScreen);
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
