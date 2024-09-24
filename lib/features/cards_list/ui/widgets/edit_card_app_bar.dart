import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards_list/manager/edit_card_cubit/edit_card_cubit.dart';
import 'package:flashcards/features/cards_list/manager/edit_card_cubit/edit_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar editCardAppBar(BuildContext context, CardModel cardModel) {
  return AppBar(
    title: const Text('Edit cards'),
    titleTextStyle: const TextStyle(fontSize: 24),
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.close_rounded),
    ),
    actions: [
      BlocListener<EditCardCubit, EditCardState>(
        listener: (context, state) async {
          if (state is EditCardSuccess) {
            await BlocProvider.of<CardListCubit>(context)
                .fetchCards(cardModel.setId!);
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        },
        child: IconButton(
          onPressed: () async {
            EditCardCubit controller = context.read<EditCardCubit>();
            if (controller.formKey.currentState?.validate() ?? false) {
              CardModel cards = CardModel(
                id: cardModel.id,
                question: controller.questionController.text,
                supplementQuestion:
                    controller.supplementQuestionController.text,
                answer: controller.answerController.text,
                supplementAnswer: controller.supplementAnswerController.text,
              );
              await controller.updateCard(cards);
            }
          },
          icon: const Icon(Icons.check),
        ),
      ),
    ],
  );
}
