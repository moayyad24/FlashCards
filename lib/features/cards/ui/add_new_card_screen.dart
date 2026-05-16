import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/core/widgets/custom_input_field.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards/ui/widgets/add_card_app_bar.dart';
import 'package:cardy/features/cards/ui/widgets/save_card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewCardScreen extends StatefulWidget {
  final int setId;
  const AddNewCardScreen({super.key, required this.setId});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _questionController;
  late TextEditingController _supplementQuestionController;
  late TextEditingController _answerController;
  late TextEditingController _supplementAnswerController;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _questionController = TextEditingController();
    _supplementQuestionController = TextEditingController();
    _answerController = TextEditingController();
    _supplementAnswerController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addCardAppBar(context),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14).r,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomInputField(
                  label: 'Question',
                  hintText: 'Enter your question here...',
                  controller: _questionController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a question';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  label: 'Supplement of question (Optional)',
                  hintText: 'Enter your supplement of question here...',
                  controller: _supplementQuestionController,
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  label: 'Answer',
                  hintText: 'Enter the correct answer or explanation...',
                  controller: _answerController,
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  label: 'Supplement of answer (Optional)',
                  hintText: 'Enter your supplement of answer here...',
                  controller: _supplementAnswerController,
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                SaveCardButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      CardModel cards = CardModel(
                          question: _questionController.text,
                          supplementQuestion:
                              _supplementQuestionController.text,
                          answer: _answerController.text,
                          supplementAnswer: _supplementAnswerController.text,
                          setId: widget.setId);
                      await BlocProvider.of<CardsListCubit>(context)
                          .insertAnewCard(cards);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
                SaveAndAddAnotherButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      CardModel cards = CardModel(
                        question: _questionController.text,
                        supplementQuestion: _supplementQuestionController.text,
                        answer: _answerController.text,
                        supplementAnswer: _supplementAnswerController.text,
                        setId: widget.setId,
                      );

                      await BlocProvider.of<CardsListCubit>(context)
                          .insertAnewCard(cards);

                      // Reset all text controllers
                      _questionController.clear();
                      _supplementQuestionController.clear();
                      _answerController.clear();
                      _supplementAnswerController.clear();

                      // Reset form validation state
                      _formKey.currentState?.reset();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _questionController.dispose();
    _supplementQuestionController.dispose();
    _answerController.dispose();
    _supplementAnswerController.dispose();
    super.dispose();
  }
}
