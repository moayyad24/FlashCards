import 'package:flashcards/core/helper/routes.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_event.dart';
import 'package:flashcards/features/cards/manager/select_in_list_bloc/select_in_list_state.dart';
import 'package:flashcards/features/cards/ui/widgets/check_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({
    super.key,
    required this.cardModel,
  });

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectInListBloc, SelectInListState>(
      builder: (context, state) {
        SelectInListBloc controller = context.read<SelectInListBloc>();
        return ListTile(
          onLongPress: () {
            controller.add(AddToSelectedListEvent(cards: cardModel.id!));
          },
          onTap: () {
            if (state is StartSelectingState &&
                controller.selectedCardIdsList.isNotEmpty) {
              controller.add(AddToSelectedListEvent(cards: cardModel.id!));
            } else {
              Navigator.of(context).pushNamed(
                Routes.editCardScreen,
                arguments: {
                  'cardModel': cardModel,
                  'cardListCubit': BlocProvider.of<CardListCubit>(context),
                },
              );
            }
          },
          selected: controller.selectedCardIdsList.contains(cardModel.id!),
          selectedColor: AppColors.white,
          selectedTileColor: AppColors.greyLight.withOpacity(.6),
          leading: const Icon(Icons.reorder),
          title: Text(cardModel.question),
          subtitle: Text(cardModel.answer),
          titleTextStyle: const TextStyle(overflow: TextOverflow.ellipsis),
          subtitleTextStyle: const TextStyle(overflow: TextOverflow.ellipsis),
          trailing: CheckboxWidget(cardModel: cardModel),
        );
      },
    );
  }
}
