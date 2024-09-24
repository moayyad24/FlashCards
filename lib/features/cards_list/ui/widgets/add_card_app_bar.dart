import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar addCardAppBar(
  BuildContext context, {
  required GlobalKey<FormState> formKey,
  required TextEditingController questionController,
  required TextEditingController supplementQuestionController,
  required TextEditingController answerController,
  required TextEditingController supplementAnswerController,
  required int setId,
}) {
  return AppBar(
    title: const Text('Edit card'),
    titleTextStyle: const TextStyle(fontSize: 24),
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.close_rounded),
    ),
    actions: [
      IconButton(
        onPressed: () async {
          if (formKey.currentState?.validate() ?? false) {
            CardModel card = CardModel(
                question: questionController.text,
                supplementQuestion: supplementQuestionController.text,
                answer: answerController.text,
                supplementAnswer: supplementAnswerController.text,
                setId: setId);
            await BlocProvider.of<CardListCubit>(context).insertAnewCard(card);
            if (context.mounted) {
              Navigator.pop(context);
            }
          }
        },
        icon: const Icon(Icons.check),
      ),
    ],
  );
}
