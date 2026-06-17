import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards_test/manager/cards_test_cubit/cards_test_cubit.dart';
import 'package:cardy/features/cards_test/manager/cards_test_cubit/cards_test_state.dart';
import 'package:cardy/features/cards_test/ui/widgets/answer_buttons_bottom_bar.dart';
import 'package:cardy/features/cards_test/ui/widgets/cards_test_app_bar.dart';
import 'package:cardy/features/cards_test/ui/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsTestScreen extends StatelessWidget {
  const CardsTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cardsTestAppBar(context),
      body: BlocConsumer<CardsTestCubit, CardsTestState>(
        listener: (context, state) {
          if (state is CardsTestFinish) {
            Navigator.pushReplacementNamed(
              context,
              Routes.testResultScreen,
              arguments: {
                'cardsTestCubit': context.read<CardsTestCubit>(),
                'cardListCubit': context.read<CardsListCubit>(),
              },
            );
          }
        },
        builder: (context, state) {
          CardsTestCubit cardsTestCubit = context.read<CardsTestCubit>();
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: cardsTestCubit.transitionBuilder,
            child: Dismissible(
              key: ValueKey(cardsTestCubit.currentIndex),
              onUpdate: cardsTestCubit.onUpdate,
              onDismissed: cardsTestCubit.onDismissed,
              child: const SizedBox.expand(child: MyCard()),
            ),
          );
        },
      ),
      bottomNavigationBar: const AnswerButtonsBottomBar(),
    );
  }
}
