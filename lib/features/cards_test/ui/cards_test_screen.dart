import 'package:flashcards/features/cards_test/ui/widgets/cards_test_app_bar.dart';
import 'package:flashcards/features/cards_test/ui/widgets/cards_test_body.dart';
import 'package:flutter/material.dart';

class CardsTestScreen extends StatelessWidget {
  const CardsTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cardsTestAppBar(),
      body: const CardsTestBody(),
    );
  }
}
