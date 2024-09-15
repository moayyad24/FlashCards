import 'package:flashcards/core/helper/collection_type.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/home/data/model/home_data_model.dart';
import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
  final HomeDataModel homeModel;
  const CardListTile({
    required this.homeModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
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
