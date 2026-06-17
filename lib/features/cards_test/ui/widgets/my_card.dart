import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/widgets/slimy_card.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_state.dart';
import 'package:cardy/features/cards_test/manager/cards_test_cubit/cards_test_cubit.dart';
import 'package:cardy/features/cards_test/ui/widgets/bottom_card.dart';
import 'package:cardy/features/cards_test/ui/widgets/swiping_hint.dart';
import 'package:cardy/features/cards_test/ui/widgets/top_card.dart';
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
        final cardsTestCubit = context.read<CardsTestCubit>();
        var index = cardsTestCubit.currentIndex;
        if (state is CardListSuccess) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              12.verticalSpace,
              const SwipingHint(),
              18.verticalSpace,
              Expanded(
                child: Center(
                  child: SlimyCard(
                    color: AppColors.blue002E6A,
                    topCardHeight: 235.h,
                    bottomCardHeight: 200.h,
                    width: (.9).sw,
                    topCardWidget: TopCardWidget(card: cardsList[index]),
                    bottomCardWidget: BottomCardWidget(card: cardsList[index]),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
