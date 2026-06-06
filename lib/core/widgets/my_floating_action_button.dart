import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFloatingActionButton extends StatelessWidget {
  final void Function()? onTap;
  const MyFloatingActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 60.h,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18).r,
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
        child: Center(
          child: Icon(
            Icons.add_rounded,
            color: AppColors.white,
            size: 30.w,
          ),
        ),
      ),
    );
  }
}
