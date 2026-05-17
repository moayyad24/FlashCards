import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/widgets/slimy_card.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_state.dart';
import 'package:cardy/features/cards_test/manager/cards_test_cubit/cards_test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsListCubit, CardListState>(
      builder: (context, state) {
        List<CardModel> cardsList =
            context.read<CardsListCubit>().filteredCardsList;
        var index = context.read<CardsTestCubit>().currentIndex;
        if (state is CardListSuccess) {
          return SlimyCard(
            color: AppColors.blue002E6A,
            topCardHeight: 225.h,
            bottomCardHeight: 200.h,
            width: (.9).sw,
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30).r,
        child: Column(
          children: [
            Text(
              card.question,
              style: AppTextStyles.bold20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              card.supplementQuestion,
              style: AppTextStyles.medium18,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            card.answer,
            style: AppTextStyles.bold20,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            card.supplementAnswer,
            style: AppTextStyles.medium18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
