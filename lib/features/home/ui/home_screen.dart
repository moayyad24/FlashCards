import 'package:cardy/features/home/ui/widgets/home_app_bar.dart';
import 'package:cardy/features/home/ui/widgets/home_list_view.dart';
import 'package:cardy/features/home/ui/widgets/my_floating_action_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Cardy',
      )),
      floatingActionButton: const MyFloatingActionButton(),
      body: const SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(),
          HomeListView(),
        ],
      )),
    );
  }
}
