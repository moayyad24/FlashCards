import 'package:flashcards/features/cards/data/models/card_model.dart';
import 'package:flashcards/features/cards/data/repo/cards_repo_impl.dart';
import 'package:flashcards/features/cards/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards/manager/edit_card_cubit/edit_card_cubit.dart';
import 'package:flashcards/features/cards/ui/edit_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({
    super.key,
    required CardModel cardModel,
  }) : _cardModel = cardModel;
  final CardModel _cardModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return BlocProvider.value(
            value: BlocProvider.of<CardListCubit>(context),
            child: BlocProvider(
              create: (context) => EditCardCubit(CardsRepoImpl())
                ..initializeController(_cardModel),
              child: EditCardScreen(cardModel: _cardModel),
            ),
          );
        }));
      },
      leading: const Icon(Icons.format_line_spacing),
      title: Text(_cardModel.question),
      subtitle: Text(_cardModel.answer),
    );
  }
}
