import 'package:flashcards/features/home/ui/widgets/home_list_view.dart';
import 'package:flashcards/features/home/ui/widgets/home_title.dart';
import 'package:flashcards/features/home/ui/widgets/my_floating_action_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: MyFloatingActionButton(),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 30),
          HomeTitle(),
          HomeListView(),
        ],
      )),
    );
  }
}
