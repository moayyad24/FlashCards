import 'package:cardy/features/home/ui/widgets/bundle_card.dart';
import 'package:cardy/features/home/ui/widgets/home_app_bar.dart';
import 'package:cardy/features/home/ui/widgets/home_list_view.dart';
import 'package:cardy/features/home/ui/widgets/my_floating_action_button.dart';
import 'package:cardy/features/home/ui/widgets/set_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      floatingActionButton: MyFloatingActionButton(),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BundleCard(),
          SizedBox(
            height: 20,
          ),
          SetCard(),
          HomeListView(),
        ],
      )),
    );
  }
}
