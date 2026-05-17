import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards_test/manager/cards_test_cubit/cards_test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar cardsTestAppBar(BuildContext context) {
  CardsTestCubit cardsTestCubit = context.read<CardsTestCubit>();
  return AppBar(
    title: const Text(
      'Test',
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: IconButton(
          onPressed: () {
            (cardsTestCubit.currentIndex < cardsTestCubit.cardsList.length)
                ? Navigator.of(context)
                    .pushNamed(Routes.editCardScreen, arguments: {
                    'cardModel': context
                        .read<CardsListCubit>()
                        .filteredCardsList[cardsTestCubit.currentIndex],
                    'cardListCubit': context.read<CardsListCubit>(),
                  })
                : null;
          },
          icon: const Icon(Icons.edit),
        ),
      ),
    ],
  );
}
