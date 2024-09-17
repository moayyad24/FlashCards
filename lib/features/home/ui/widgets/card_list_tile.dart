import 'package:flashcards/core/helper/collection_type.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/cards/data/repo/cards_repo_impl.dart';
import 'package:flashcards/features/cards/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards/ui/cards_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        _navigateToCardListScreen(context);
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

  void _navigateToCardListScreen(BuildContext context) {
    homeModel.type == CollectionType.sets
        ? Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => CardListCubit(CardsRepoImpl())
                    ..fetchCards(homeModel.setId!),
                  child: CardsListScreen(collectionModel: homeModel),
                )))
        : null;
  }
}
