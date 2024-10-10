import 'package:flashcards/core/widgets/app_text_field.dart';
import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards/manager/edit_card_cubit/edit_card_cubit.dart';
import 'package:flashcards/features/cards/ui/widgets/edit_card_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCardScreen extends StatelessWidget {
  final CardModel cardModel;
  const EditCardScreen({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: editCardAppBar(context, cardModel),
      body: Form(
        key: context.read<EditCardCubit>().formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              AppTextField(
                hintText: 'Question',
                controller: context.read<EditCardCubit>().questionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a question';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AppTextField(
                hintText: 'Supplement of question',
                controller:
                    context.read<EditCardCubit>().supplementQuestionController,
              ),
              const SizedBox(height: 20),
              AppTextField(
                hintText: 'Answer',
                controller: context.read<EditCardCubit>().answerController,
              ),
              const SizedBox(height: 20),
              AppTextField(
                hintText: 'Supplement of answer',
                controller:
                    context.read<EditCardCubit>().supplementAnswerController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
