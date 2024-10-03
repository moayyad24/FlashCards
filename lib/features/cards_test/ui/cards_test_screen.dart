import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards_test/ui/widgets/cards_test_app_bar.dart';
import 'package:flashcards/features/cards_test/ui/widgets/cards_test_body.dart';
import 'package:flutter/material.dart';

class CardsTestScreen extends StatelessWidget {
  final List<CardModel> cardsList;
  const CardsTestScreen({super.key, required this.cardsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cardsTestAppBar(),
      body: CardsTestBody(cardsList: cardsList),
    );
  }
}
