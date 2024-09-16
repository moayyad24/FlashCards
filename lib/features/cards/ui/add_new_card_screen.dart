import 'package:flashcards/features/cards/ui/widgets/add_card_app_bar.dart';
import 'package:flutter/material.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addCardAppBar(),
    );
  }
}
