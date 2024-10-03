import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/core/widgets/slimy_card.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final CardModel card;
  const MyCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return SlimyCard(
      color: AppColors.cornflowerBlue,
      topCardWidget: topCardWidget(),
      bottomCardWidget: bottomCardWidget(),
    );
  }

  Widget topCardWidget() {
    return Text(
      card.question,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(.85),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget bottomCardWidget() {
    return Text(
      card.answer,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(.85),
      ),
      textAlign: TextAlign.center,
    );
  }
}
