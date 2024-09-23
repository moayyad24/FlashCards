import 'package:flutter/material.dart';

void appDialog({
  required BuildContext context,
  required String title,
  void Function()? onPressed,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: Text(title),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(_).pop();
            },
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}
