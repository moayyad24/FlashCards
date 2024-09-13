import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/home/data/model/set_model.dart';
import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
  final SetModel setModel;
  const CardListTile({
    required this.setModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const Icon(
        Icons.folder,
        color: AppColors.sulu,
      ),
      title: Text(setModel.title),
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      subtitle: Text(setModel.description),
      subtitleTextStyle:
          const TextStyle(color: AppColors.greyLight, fontSize: 16),
    );
  }
}
