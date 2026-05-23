import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  final int? maxLength;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = AppColors.darkblue10131A;
    const Color hintColor = AppColors.border8C909F;
    const Color textColor = AppColors.greyLightE1E2EC;
    const Color borderColor = AppColors.border424754;
    const Color errorBorderColor = AppColors.orangeFFB786;
    const Color focusBorderColor = AppColors.blueADC6FF;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Field Label
        Text(
          label,
          style: AppTextStyles.bold14,
        ),
        const SizedBox(height: 10),

        // Text Field Input Container
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength,
          textInputAction: textInputAction,
          validator: validator,
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
          ),
          cursorColor: focusBorderColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            fillColor: backgroundColor,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ).r,
            // Default rest border
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: borderColor,
                width: 1.5,
              ),
            ),
            // Focused border state
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: focusBorderColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: errorBorderColor,
                width: 1.5,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: borderColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
