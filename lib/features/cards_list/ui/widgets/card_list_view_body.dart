import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_state.dart';
import 'package:flashcards/features/cards_list/ui/widgets/card_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListViewBody extends StatelessWidget {
  const CardListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardListCubit, CardListState>(
      builder: (context, state) {
        if (state is CardListSuccess) {
          return Expanded(
            child: ListView.builder(
                itemCount: state.cardList.length,
                itemBuilder: (context, index) {
                  return CardListTile(
                    cardModel: state.cardList[index],
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
