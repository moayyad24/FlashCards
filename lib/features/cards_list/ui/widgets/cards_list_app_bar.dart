import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_state.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:flashcards/features/cards_list/ui/widgets/selecting_app_bar.dart';
import 'package:flashcards/features/cards_list/ui/widgets/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CardsListAppBar extends StatelessWidget {
  const CardsListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectInListBloc, SelectInListState>(
        builder: (context, state) {
      return state is StartSelectingState
          ? SelectingAppBar(
              collectionModel: context.read<CardListCubit>().setModel,
            )
          : DefaultAppBar(
              collectionModel: context.read<CardListCubit>().setModel,
            );
    });
  }
}
