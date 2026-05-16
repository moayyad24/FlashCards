import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final Widget? suffixIcon;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Search cards...',
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 12.0,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: AppColors.greyLightE1E2EC, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.medium16,
          prefixIcon:
              const Icon(Icons.search, color: AppColors.greyLightE1E2EC),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: AppColors.grey272A31,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
