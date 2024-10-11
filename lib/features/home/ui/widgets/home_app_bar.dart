import 'package:flashcards/core/helper/routes.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    actions: [
      IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.settingsScreen);
        },
        icon: const Icon(Icons.settings),
      ),
    ],
  );
}
