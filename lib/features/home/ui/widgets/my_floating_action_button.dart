import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/home/ui/widgets/home_bottom_sheet.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Ensure the splash effect follows the rounded square shape
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        _buildModalBottomSheet(context);
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4F79F4),
              Color(0xFF562BCA),
            ],
          ),
          // Add the glowing shadow effect seen in the image
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5D38DD).withAlpha(100),
              blurRadius: 18,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: AppColors.white,
            size: 30,
          ),
        ),
      ),
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
