import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Cardy',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
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
        const SizedBox(width: 8),
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
        const SizedBox(width: 15),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
