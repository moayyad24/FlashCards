import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_event.dart';
import 'package:flashcards/features/cards_list/ui/widgets/card_list_view_body.dart';
import 'package:flashcards/features/cards_list/ui/widgets/cards_list_app_bar.dart';
import 'package:flashcards/features/cards_list/ui/widgets/cards_list_floating_action_button.dart';
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
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          var selectionController = context.read<SelectInListBloc>();
          if (didPop) {
            return;
          }
          if (selectionController.selectedCardIdsList.isNotEmpty) {
            selectionController.selectedCardIdsList.clear();
            selectionController.add(EndSelectingEvent());
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Column(
          children: [
            CardsListAppBar(collectionModel: _collectionModel),
           const CardListViewBody(),
          ],
        ),
      ),
    );
  }
}
