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
      topCardHeight: MediaQuery.sizeOf(context).height * 0.3,
      bottomCardHeight: MediaQuery.sizeOf(context).height * 0.4,
      topCardWidget: topCardWidget(),
      bottomCardWidget: bottomCardWidget(),
    );
  }

  Widget topCardWidget() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        Text(
          card.question,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Text(
          card.supplementQuestion,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(.85),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget bottomCardWidget() {
    return ListView(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      children: [
        Text(
          card.answer,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Text(
          card.supplementAnswer,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(.85),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
