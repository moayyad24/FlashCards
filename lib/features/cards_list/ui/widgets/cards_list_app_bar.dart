import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_event.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListAppBar extends StatelessWidget {
  final CollectionModel _collectionModel;
  const CardsListAppBar({super.key, required CollectionModel collectionModel})
      : _collectionModel = collectionModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectInListBloc, SelectInListState>(
        builder: (contextS, state) {
      List<int> cardIds = contextS.read<SelectInListBloc>().selectedCardIdsList;
      return state is StartSelectingState
          ? AppBar(
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.close_rounded)),
              title: Text(
                '${cardIds.length}',
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, cardIds);
                    },
                    icon: const Icon(Icons.delete)),
              ],
            )
          : AppBar(
              title: Text(
                _collectionModel.title,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            );
    });
  }

  void _showDeleteConfirmationDialog(BuildContext context, cardIds) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to delete?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                var cardListCubit = BlocProvider.of<CardListCubit>(context);
                var selectionBloc = BlocProvider.of<SelectInListBloc>(context);
                Navigator.of(context).pop();
                await cardListCubit.deleteCards(cardIds);
                selectionBloc.selectedCardIdsList.clear();
                selectionBloc.add(EndSelectingEvent());
                await cardListCubit.fetchCards(_collectionModel.setId!);
              },
            ),
          ],
        );
      },
    );
  }
}
