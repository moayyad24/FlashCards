import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListAppBar extends StatelessWidget {
  final CollectionModel _collectionModel;
  const CardsListAppBar({super.key, required CollectionModel collectionModel})
      : _collectionModel = collectionModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectInListBloc, SelectInListState>(
        builder: (context, state) {
      return context.read<SelectInListBloc>().selectedCardList.isEmpty
          ? AppBar(
              title: Text(
                _collectionModel.title,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            )
          : AppBar(
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.close_rounded)),
              title: const Text(
                '1 Selected',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              ],
            );
    });
  }
}
