import 'package:flashcards/core/widgets/app_text_field.dart';
import 'package:flashcards/features/cards/ui/widgets/add_card_app_bar.dart';
import 'package:flutter/material.dart';

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
      appBar: addCardAppBar(context,
          formKey: _formKey,
          questionController: _questionController,
          supplementQuestionController: _supplementQuestionController,
          answerController: _answerController,
          supplementAnswerController: _supplementAnswerController,
          setId: widget.setId),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              AppTextField(
                hintText: 'Question',
                controller: _questionController,
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
                controller: _supplementQuestionController,
              ),
              const SizedBox(height: 20),
              AppTextField(
                hintText: 'Answer',
                controller: _answerController,
              ),
              const SizedBox(height: 20),
              AppTextField(
                hintText: 'Supplement of answer',
                controller: _supplementAnswerController,
              ),
            ],
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
