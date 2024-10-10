import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards_list/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:flashcards/features/cards_list/manager/edit_card_cubit/edit_card_cubit.dart';
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
      IconButton(
        onPressed: () async {
          EditCardCubit editCardCubit = context.read<EditCardCubit>();
          CardListCubit cardListCubit = context.read<CardListCubit>();
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
            await cardListCubit.fetchCards();
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
