import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewBottomBar extends StatelessWidget {
  const CreateNewBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff10131a),
          border:
              Border(top: BorderSide(color: AppColors.border1C1F26, width: 2))),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: SafeArea(
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              print('Create Set tapped!');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueADC6FF,
              foregroundColor: AppColors.purple2B2148,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: 22.w,
                ),
                const SizedBox(width: 8),
                Text(
                  'Create Set',
                  style: AppTextStyles.medium16
                      .copyWith(color: AppColors.purple2B2148),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
