import 'package:flashcards/features/home/ui/widgets/home_app_bar.dart';
import 'package:flashcards/features/home/ui/widgets/home_list_view.dart';
import 'package:flashcards/features/home/ui/widgets/home_title.dart';
import 'package:flashcards/features/home/ui/widgets/my_floating_action_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      floatingActionButton: const MyFloatingActionButton(),
      body: const SafeArea(
          child: Column(
        children: [
          HomeTitle(),
          HomeListView(),
        ],
      )),
    );
  }
}
