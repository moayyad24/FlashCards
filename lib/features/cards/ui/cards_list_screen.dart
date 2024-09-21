import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/cards/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards/manager/card_list_cubit/card_list_state.dart';
import 'package:flashcards/features/cards/ui/widgets/card_list_view_body.dart';
import 'package:flashcards/features/cards/ui/widgets/cards_list_app_bar.dart';
import 'package:flashcards/features/cards/ui/widgets/cards_list_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListScreen extends StatelessWidget {
  const CardsListScreen({super.key, required CollectionModel collectionModel})
      : _collectionModel = collectionModel;
  final CollectionModel _collectionModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          CardsListsFloatingActionButton(setId: _collectionModel.setId!),
      body: Column(
        children: [
          CardsListAppBar(collectionModel: _collectionModel),
          Expanded(
            child: BlocBuilder<CardListCubit, CardListState>(
              builder: (context, state) {
                if (state is CardListSuccess) {
                  return CardListViewBody(
                    cardList: state.cardList,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
