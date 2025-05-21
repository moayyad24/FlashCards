import 'package:cardy/core/helper/routes.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeTitle(),
          HomeActionButton(),
        ],
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cardy',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        ),
        Text(
          'Pick a set to practice',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class HomeActionButton extends StatelessWidget {
  const HomeActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.settingsScreen);
      },
      icon: const Icon(Icons.settings),
    );
  }
}
