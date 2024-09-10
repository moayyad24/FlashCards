import 'package:flashcards/features/home/ui/widgets/card_list_tile.dart';
import 'package:flashcards/features/home/ui/widgets/home_title.dart';
import 'package:flashcards/features/home/ui/widgets/my_floating_action_button.dart';
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
      floatingActionButton: const MyFloatingActionButton(),
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
    );
  }
}
