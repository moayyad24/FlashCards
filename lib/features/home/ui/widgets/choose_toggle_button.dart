import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToggleOption { sets, bundle }

class ChooseToggleButton extends StatefulWidget {
  final Function(ToggleOption) onOptionChanged;

  const ChooseToggleButton({
    super.key,
    required this.onOptionChanged,
  });

  @override
  State<ChooseToggleButton> createState() => _ChooseToggleButtonState();
}

class _ChooseToggleButtonState extends State<ChooseToggleButton> {
  ToggleOption _selectedOption = ToggleOption.sets;

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = AppColors.darkblue10131A;
    const Color activeColor = AppColors.blueADC6FF;
    const Color inactiveTextColor = AppColors.greyLightE1E2EC;
    const Color activeTextColor = AppColors.purple2B2148;
    const Color borderColor = AppColors.border424754;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.maxFinite,
          height: 56.h,
          padding: const EdgeInsets.all(6).r,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Stack(
            children: [
              // Sliding Active Background Slider
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOutCubic,
                top: 0,
                bottom: 0,
                left: _selectedOption == ToggleOption.sets
                    ? 0
                    : (constraints.maxWidth - 16.r) / 2,
                width: (constraints.maxWidth - 16.r) / 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              // Interactive Buttons Layer
              Row(
                children: [
                  // New Set Button
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() => _selectedOption = ToggleOption.sets);
                        widget.onOptionChanged(ToggleOption.sets);
                      },
                      child: _ButtonContent(
                        label: 'New Set',
                        icon: Icons.add_to_photos_outlined,
                        isSelected: _selectedOption == ToggleOption.sets,
                        activeColor: activeTextColor,
                        inactiveColor: inactiveTextColor,
                      ),
                    ),
                  ),

                  // New Bundle Button
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() => _selectedOption = ToggleOption.bundle);
                        widget.onOptionChanged(ToggleOption.bundle);
                      },
                      child: _ButtonContent(
                        label: 'New Folder',
                        icon: Icons.folder_copy_outlined,
                        isSelected: _selectedOption == ToggleOption.bundle,
                        activeColor: activeTextColor,
                        inactiveColor: inactiveTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Helper widget to handle smooth icon and text color cross-fading
class _ButtonContent extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final Color activeColor;
  final Color inactiveColor;

  const _ButtonContent({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color currentColor = isSelected ? activeColor : inactiveColor;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Smoothly transition icon color
          AnimatedColorAsWidget(
            color: currentColor,
            duration: const Duration(milliseconds: 200),
            builder: (context, color) => Icon(icon, color: color, size: 20.w),
          ),
          const SizedBox(width: 8),
          // Smoothly transition text color and weight
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTextStyles.regular14.copyWith(
              color: currentColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}

/// Simple micro-helper to animate basic color properties easily without heavy states
class AnimatedColorAsWidget extends StatelessWidget {
  final Color color;
  final Duration duration;
  final Widget Function(BuildContext, Color) builder;

  const AnimatedColorAsWidget({
    super.key,
    required this.color,
    required this.duration,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(begin: color, end: color),
      duration: duration,
      builder: (context, animatedColor, _) {
        return builder(context, animatedColor ?? color);
      },
    );
  }
}
