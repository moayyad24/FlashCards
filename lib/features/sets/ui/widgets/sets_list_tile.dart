import 'package:flashcards/core/theme/colors.dart';
import 'package:flutter/material.dart';
class SetsListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const SetsListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.folder,
        color: AppColors.sulu,
      ),
      title: Text(title),
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      subtitle: Text(subtitle),
      subtitleTextStyle:
          const TextStyle(color: AppColors.greyLight, fontSize: 16),
    );
  }
}
