import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveCardButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SaveCardButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4A80FF),
            Color(0xFF6938FF),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Save Card',
              style: AppTextStyles.bold18.copyWith(color: AppColors.white),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.check_circle_outline,
              color: AppColors.white,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}

class SaveAndAddAnotherButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SaveAndAddAnotherButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border424754, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Save & Add Another',
          style: AppTextStyles.bold18.copyWith(color: AppColors.blueADC6FF),
        ),
      ),
    );
  }
}
