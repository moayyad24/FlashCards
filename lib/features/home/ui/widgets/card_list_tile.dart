import 'package:flashcards/core/helper/app_routes.dart';
import 'package:flashcards/core/helper/collection_type.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
  final CollectionModel homeModel;
  const CardListTile({
    required this.homeModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        homeModel.type == CollectionType.sets
            ? Navigator.of(context)
                .pushNamed(AppRoutes.cardsList, arguments: homeModel)
            : null;
      },
      leading: Icon(
        homeModel.type == CollectionType.sets
            ? Icons.folder
            : Icons.folder_copy,
        color: AppColors.sulu,
      ),
      title: Text(homeModel.title),
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      subtitle: Text(homeModel.description),
      subtitleTextStyle:
          const TextStyle(color: AppColors.greyLight, fontSize: 16),
    );
  }
}
