
  import 'package:flutter/material.dart';

AppBar addCardAppBar() {
    return AppBar(
      title: const Text('Edit card'),
      titleTextStyle: const TextStyle(fontSize: 24),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.close_rounded),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
