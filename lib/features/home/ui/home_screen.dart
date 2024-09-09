import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/home/ui/widgets/card_list_tile.dart';
import 'package:flashcards/features/home/ui/widgets/home_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
              )),
        ],
      ),
      body: const SafeArea(
          child: Column(
        children: [
          HomeTitle(),
          CardListTile(),
          CardListTile(),
          CardListTile(),
          CardListTile(),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.grey,
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.cornflowerBlue.withOpacity(.2),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(
                    Icons.home_outlined,
                    color: AppColors.cornflowerBlue,
                  ),
                ),
                const Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cornflowerBlue),
                )
              ],
            ),
            const Column(
              children: [
                Icon(
                  Icons.home_outlined,
                ),
                Text('home')
              ],
            ),
            const Column(
              children: [
                Icon(
                  Icons.home_outlined,
                ),
                Text('home')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
