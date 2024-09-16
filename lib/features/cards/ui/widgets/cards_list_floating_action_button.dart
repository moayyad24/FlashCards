import 'package:flashcards/core/helper/app_routes.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CardsListsFloatingActionButton extends StatelessWidget {
  const CardsListsFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.addNewCard);
            },
            heroTag: 'first',
            backgroundColor: AppColors.greyLight,
            child: const Icon(Icons.add),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {},
            heroTag: 'second',
            child: const Icon(Icons.play_arrow),
          ),
        ),
      ],
    );
  }
}
