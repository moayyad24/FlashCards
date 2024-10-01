import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/cards_test/ui/widgets/cards_test_app_bar.dart';
import 'package:flutter/material.dart';

class CardsTestScreen extends StatefulWidget {
  final List<CardModel> cardsList;
  const CardsTestScreen({super.key, required this.cardsList});

  @override
  State<CardsTestScreen> createState() => _CardsTestScreenState();
}

class _CardsTestScreenState extends State<CardsTestScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cardsTestAppBar(),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final curvedAnimation =
                CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: const Offset(0, 0),
              ).animate(curvedAnimation),
              child: child,
            );
          },
          child: Dismissible(
            key: ValueKey(currentIndex),
            onDismissed: (c) {
              setState(() {
                currentIndex++;
                // Loop back if we've reached the end
                if (currentIndex >= widget.cardsList.length) {
                  currentIndex = 0;
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 600,
              width: 300,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Test',
                        style: TextStyle(color: AppColors.greyLight),
                      ),
                      Text(
                        '${currentIndex + 1}/${widget.cardsList.length}',
                        style: const TextStyle(color: AppColors.greyLight),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.cardsList[currentIndex].question,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(color: AppColors.greyLight),
                  Text(
                    widget.cardsList[currentIndex].answer,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
