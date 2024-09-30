import 'package:flutter/material.dart';

AppBar cardsTestAppBar() {
  return AppBar(
    title: const Text(
      'Test',
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.edit),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_upward_rounded),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
      ),
    ],
  );
}
