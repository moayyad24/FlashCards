import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_state.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:flashcards/features/cards_list/ui/widgets/selecting_app_bar.dart';
import 'package:flashcards/features/cards_list/ui/widgets/default_app_bar.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CardsListAppBar extends StatelessWidget {
  final CollectionModel _collectionModel;
  const CardsListAppBar({super.key, required CollectionModel collectionModel})
      : _collectionModel = collectionModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectInListBloc, SelectInListState>(
        builder: (context, state) {
      return state is StartSelectingState
          ? SelectingAppBar(
              collectionModel: _collectionModel,
            )
          : DefaultAppBar(
              collectionModel: _collectionModel,
            );
    });
  }
}

