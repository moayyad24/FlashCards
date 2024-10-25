import 'package:flashcards/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SettingsSectionTitle extends StatelessWidget {
  final String title;
  const SettingsSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.pink,
        ),
      ),
    );
  }
}
