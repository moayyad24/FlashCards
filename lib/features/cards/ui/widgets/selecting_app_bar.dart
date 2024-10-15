import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectingAppBar extends StatelessWidget {
  const SelectingAppBar({
    super.key,
    required this.collectionModel,
  });

  final CollectionModel collectionModel;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.close_rounded)),
      title: Text(
        '${context.read<SelectInListBloc>().selectedCardIdsList.length} Selected',
        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
            icon: const Icon(Icons.delete)),
      ],
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    List<int> cardIds = context.read<SelectInListBloc>().selectedCardIdsList;
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
                var cardListCubit = BlocProvider.of<CardsListCubit>(context);
                var selectionBloc = BlocProvider.of<SelectInListBloc>(context);
                Navigator.of(context).pop();
                await cardListCubit.deleteCards(cardIds);
                selectionBloc.selectedCardIdsList.clear();
                selectionBloc.add(EndSelectingEvent());
                await cardListCubit.fetchCards();
              },
            ),
          ],
        );
      },
    );
  }
}
