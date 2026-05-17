import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar {
  static void showSuccess(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: const Color(0xFF006A6F),
      icon: Icons.check_circle_rounded,
      iconColor: AppColors.greyLightE1E2EC,
      title: 'success',
    );
  }

  static void showError(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: const Color(0xff93000a),
      icon: Icons.error_rounded,
      iconColor: AppColors.greyLightE1E2EC,
      title: 'failed',
    );
  }

  static void showInfo(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: const Color(0xff002e6a),
      icon: Icons.info_rounded,
      iconColor: AppColors.greyLightE1E2EC,
      title: 'information',
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
    required Color iconColor,
    required String title,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: backgroundColor,
      margin: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 18.h),
      borderRadius: BorderRadius.circular(16.r),
      icon: Icon(icon, color: iconColor, size: 22.sp),
      messageText: Text(
        message,
        maxLines: 2,
        style: AppTextStyles.medium14,
        overflow: TextOverflow.ellipsis,
      ),
      duration: const Duration(seconds: 3),
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 400),
      forwardAnimationCurve: Curves.easeOutCubic,
      reverseAnimationCurve: Curves.easeInCubic,
      isDismissible: true,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      mainButton: (actionLabel != null && onAction != null)
          ? TextButton(
              onPressed: () {
                onAction();
              },
              child: Text(
                actionLabel,
                style: AppTextStyles.medium14,
              ),
            )
          : null,
    ).show(context);
  }
}
