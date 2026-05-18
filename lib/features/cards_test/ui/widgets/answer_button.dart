import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.accentColor,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final Color accentColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: isSelected ? accentColor : AppColors.darkblue10131A,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? accentColor : AppColors.border424754,
          width: 2,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? AppColors.greyLightE1E2EC : accentColor,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: AppTextStyles.bold14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
