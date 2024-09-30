import 'package:flashcards/core/helper/routes.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListsFloatingActionButton extends StatelessWidget {
  const CardsListsFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(Routes.addNewCardScreen, arguments: {
                'setId': BlocProvider.of<CardListCubit>(context).setModel.setId,
                'cardListCubit': BlocProvider.of<CardListCubit>(context)
              });
            },
            heroTag: 'first',
            backgroundColor: AppColors.greyLight,
            child: const Icon(Icons.add),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.cardsTestScreen);
            },
            heroTag: 'second',
            child: const Icon(Icons.play_arrow),
          ),
        ),
      ],
    );
  }
}
