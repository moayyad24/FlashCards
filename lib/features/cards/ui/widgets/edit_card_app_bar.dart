import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards/manager/edit_card_cubit/edit_card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar editCardAppBar(BuildContext context, CardModel cardModel) {
  return AppBar(
    title: const Text('Edit cards'),
    titleTextStyle: const TextStyle(fontSize: 24),
    actions: [
      IconButton(
        onPressed: () async {
          EditCardCubit editCardCubit = context.read<EditCardCubit>();
          CardsListCubit cardListCubit = context.read<CardsListCubit>();
          if (editCardCubit.formKey.currentState?.validate() ?? false) {
            CardModel cards = CardModel(
              id: cardModel.id,
              question: editCardCubit.questionController.text,
              supplementQuestion:
                  editCardCubit.supplementQuestionController.text,
              answer: editCardCubit.answerController.text,
              supplementAnswer: editCardCubit.supplementAnswerController.text,
            );
            await editCardCubit.updateCard(cards);
            await cardListCubit.refreshCardsList();
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        },
        icon: const Icon(Icons.check),
      ),
    ],
  );
}
