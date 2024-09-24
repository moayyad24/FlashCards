import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/home/ui/widgets/home_bottom_sheet.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _buildModalBottomSheet(context);
      },
      child: const Icon(Icons.add),
    );
  }

  Future<dynamic> _buildModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.black,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const HomeBottomSheet();
      },
    );
  }
}
