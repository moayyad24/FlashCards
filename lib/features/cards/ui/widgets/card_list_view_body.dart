import 'package:flashcards/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:flashcards/features/cards/manager/cards_list_cubit/cards_list_state.dart';
import 'package:flashcards/features/cards/ui/widgets/card_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListViewBody extends StatelessWidget {
  const CardListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsListCubit, CardListState>(
      builder: (context, state) {
        if (state is CardListSuccess || state is CardListSetEdited) {
          return Expanded(
            child: ListView.builder(
                itemCount: context.read<CardsListCubit>().cardsList.length,
                itemBuilder: (context, index) {
                  return CardListTile(
                    cardModel: context.read<CardsListCubit>().cardsList[index],
                  );
                }),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
