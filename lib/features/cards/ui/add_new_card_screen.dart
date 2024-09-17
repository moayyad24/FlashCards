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
  late TextEditingController _questionController;
  late TextEditingController _supplementQuestionController;
  late TextEditingController _answerController;
  late TextEditingController _supplementAnswerController;
  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController();
    _supplementQuestionController = TextEditingController();
    _answerController = TextEditingController();
    _supplementAnswerController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addCardAppBar(context,
          questionController: _questionController,
          supplementQuestionController: _supplementQuestionController,
          answerController: _answerController,
          supplementAnswerController: _supplementAnswerController,
          setId: widget.setId),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              AppTextField(
                hintText: 'Question',
                controller: _questionController,
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
