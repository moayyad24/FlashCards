import 'package:flutter/material.dart';

class SetsListScreenTitle extends StatelessWidget {
  final String _title;
  const SetsListScreenTitle({super.key, required String title})
      : _title = title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          _title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
