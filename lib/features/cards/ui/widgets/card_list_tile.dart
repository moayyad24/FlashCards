import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/cards/data/models/card_model.dart';
import 'package:flashcards/features/cards/data/repo/cards_repo_impl.dart';
import 'package:flashcards/features/cards/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards/manager/edit_card_cubit/edit_card_cubit.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_event.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_state.dart';
import 'package:flashcards/features/cards/ui/edit_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({
    super.key,
    required CardModel cardModel,
  }) : _cardModel = cardModel;
  final CardModel _cardModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectInListBloc, SelectInListState>(
      builder: (context, state) {
        SelectInListBloc controller = context.read<SelectInListBloc>();
        return ListTile(
          onLongPress: () {
            controller.add(AddToSelectedListEvent(card: _cardModel));
          },
          onTap: () {
            if (state is StartSelectingState &&
                controller.selectedCardList.isNotEmpty) {
              controller.add(AddToSelectedListEvent(card: _cardModel));
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (controller) {
                return BlocProvider.value(
                  value: BlocProvider.of<CardListCubit>(context),
                  child: BlocProvider(
                    create: (context) => EditCardCubit(CardsRepoImpl())
                      ..initializeController(_cardModel),
                    child: EditCardScreen(cardModel: _cardModel),
                  ),
                );
              }));
            }
          },
          selected: controller.selectedCardList.contains(_cardModel),
          selectedColor: AppColors.white,
          selectedTileColor: AppColors.greyLight.withOpacity(.6),
          leading: const Icon(Icons.format_line_spacing),
          title: Text(_cardModel.question),
          subtitle: Text(_cardModel.answer),
        );
      },
    );
  }
}
