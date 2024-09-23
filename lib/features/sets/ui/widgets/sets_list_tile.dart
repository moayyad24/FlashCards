import 'package:flashcards/core/helper/routes.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SetsListTile extends StatelessWidget {
  final CollectionModel setModel;
  const SetsListTile({
    super.key,
    required this.setModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.cardsListScreen,
          arguments: setModel,
        );
      },
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
