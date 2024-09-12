import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;

  const AppTextField({
    required this.hintText,
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
