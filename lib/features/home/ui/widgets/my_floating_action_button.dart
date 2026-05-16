import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.pushNamed(context, Routes.addFolderSetScreen);
      },
      child: Container(
        width: 60.w,
        height: 60.w,
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
}
