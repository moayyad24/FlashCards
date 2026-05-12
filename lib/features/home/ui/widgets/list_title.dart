
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';

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
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.orangeFFB786,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.greyLightE1E2EC),
        ),
        const Spacer(),
        TextButton(
            onPressed: onViewAllPressed,
            child: const Text(
              'View All',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ))
      ],
    );
  }
}
