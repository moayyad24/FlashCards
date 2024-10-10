import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/core/widgets/slimy_card.dart';
import 'package:flashcards/features/cards_list/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:flashcards/features/cards_list/manager/cards_list_cubit/cards_list_state.dart';
import 'package:flashcards/features/cards_test/manager/cards_test_cubit/cards_test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardListCubit, CardListState>(
      builder: (context, state) {
        List<CardModel> cardsList = context.read<CardListCubit>().cardsList;
        var index = context.read<CardsTestCubit>().currentIndex;
        if (state is CardListSuccess) {
          return SlimyCard(
            color: AppColors.cornflowerBlue,
            topCardHeight: 250,
            bottomCardHeight: 200,
            topCardWidget: TopCardWidget(card: cardsList[index]),
            bottomCardWidget: BottomCardWidget(card: cardsList[index]),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class TopCardWidget extends StatelessWidget {
  final CardModel card;
  const TopCardWidget({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
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
}

class BottomCardWidget extends StatelessWidget {
  final CardModel card;
  const BottomCardWidget({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
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
