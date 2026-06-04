import 'package:cardy/core/helper/collection_type.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisualIdentityCard extends StatefulWidget {
  final Function(Color, IconData) onIdentityChanged;
  final CollectionType _selectedType;
  const VisualIdentityCard({
    super.key,
    required this.onIdentityChanged,
    required CollectionType selectedType,
  }) : _selectedType = selectedType;

  @override
  State<VisualIdentityCard> createState() => _VisualIdentityCardState();
}

class _VisualIdentityCardState extends State<VisualIdentityCard> {
  // Color palette presets
  final List<Color> _colorPresets = [
    const Color(0xFFADC4FF), // Light Blue/Lavender
    const Color(0xFFC5B4FA), // Pastel Purple
    const Color(0xFFFBC291), // Pastel Orange
    const Color(0xFFFAADAA), // Pastel Pink
  ];

  int _selectedColorIndex = 0;
  IconData _selectedIcon = Icons.library_books_rounded;

  final List<IconData> _learningIcons = [
    Icons.school_rounded,
    Icons.book_rounded,
    Icons.menu_book_rounded,
    Icons.local_library_rounded,
    Icons.library_books_rounded,
    Icons.science_rounded,
    Icons.calculate_rounded,
    Icons.language_rounded,
    Icons.history_edu_rounded,
    Icons.computer_rounded,
    Icons.architecture_rounded,
    Icons.psychology_rounded,
    Icons.auto_stories_rounded,
    Icons.biotech_rounded,
    Icons.functions_rounded,
    Icons.translate_rounded,
    Icons.lightbulb_rounded,
    Icons.quiz_rounded,
    Icons.grade_rounded,
    Icons.assignment_rounded,
    Icons.workspace_premium_rounded,
    Icons.model_training_rounded,
    Icons.tips_and_updates_rounded,
    Icons.class_rounded,
    Icons.chrome_reader_mode_rounded,
    Icons.featured_play_list_rounded,
    Icons.verified_rounded,
    Icons.cast_for_education_rounded,
  ];

  Color get _currentValuesColor => _colorPresets[_selectedColorIndex];

  // Helper method to open flutter_colorpicker dialog
  void _openColorPickerDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color tempColor = _colorPresets[index];
        return AlertDialog(
          title: Text(
            'Pick a custom color',
            style: AppTextStyles.bold18,
          ),
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: tempColor,
              onColorChanged: (color) {
                tempColor = color;
              },
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () {
                setState(() {
                  _colorPresets[index] = tempColor;
                });
                widget.onIdentityChanged(_currentValuesColor, _selectedIcon);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Helper method to trigger custom icon picker dialog
  Future<void> _pickIcon() async {
    IconData? icon = await showDialog<IconData>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.darkblue10131A,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            'Pick an icon',
            style: AppTextStyles.bold18.copyWith(color: Colors.white),
          ),
          content: SizedBox(
            width: double.maxFinite,
            height: 200.h,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: _learningIcons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) {
                final currentIcon = _learningIcons[index];
                final isSelected = currentIcon == _selectedIcon;
                return GestureDetector(
                  onTap: () => Navigator.pop(context, currentIcon),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? _currentValuesColor.withAlpha(51) // ~20% opacity
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? _currentValuesColor
                            : AppColors.border424754,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      currentIcon,
                      color: isSelected ? _currentValuesColor : Colors.white70,
                      size: 28.w,
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: AppTextStyles.medium16.copyWith(color: Colors.white70),
              ),
            ),
          ],
        );
      },
    );

    if (icon != null) {
      setState(() {
        _selectedIcon = icon;
      });
      widget.onIdentityChanged(_currentValuesColor, _selectedIcon);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color cardBackground = AppColors.darkblue10131A;
    const Color fieldBackground = AppColors.black;
    const Color borderColor = AppColors.border424754;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Row: Title & Color Presets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Visual Identity',
                style: AppTextStyles.bold18,
              ),

              // Color Dots List
              Row(
                children: List.generate(_colorPresets.length, (index) {
                  final bool isSelected = _selectedColorIndex == index;
                  return GestureDetector(
                    onTap: () {
                      if (isSelected) {
                        // Tapping an already selected dot opens the custom color picker
                        _openColorPickerDialog(index);
                      } else {
                        setState(() => _selectedColorIndex = index);
                        widget.onIdentityChanged(
                            _currentValuesColor, _selectedIcon);
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(left: 10),
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: _colorPresets[index],
                        shape: BoxShape.circle,
                        // Gives the active color an elegant selection indicator ring
                        border: isSelected
                            ? Border.all(color: Colors.white, width: 2.5)
                            : null,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: _colorPresets[index].withAlpha(80),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                    ),
                  );
                }),
              )
            ],
          ),

          // Icon Picker Button
          if (widget._selectedType == CollectionType.sets)
            Column(
              children: [
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: _pickIcon,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 18)
                            .r,
                    decoration: BoxDecoration(
                      color: fieldBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor, width: 1.2),
                    ),
                    child: Row(
                      children: [
                        // Animated Dynamic Icon (Tinted to match current selected color slot)
                        AnimatedColorAsWidget(
                          color: _currentValuesColor,
                          duration: const Duration(milliseconds: 200),
                          builder: (context, color) => Icon(
                            _selectedIcon,
                            color: color,
                            size: 24.w,
                          ),
                        ),
                        const SizedBox(width: 14),

                        // Label
                        Text(
                          'Select Icon',
                          style: AppTextStyles.medium16,
                        ),
                        const Spacer(),

                        // Trailing Chevron
                        Icon(
                          Icons.chevron_right_rounded,
                          color: const Color(0xFF64748B),
                          size: 22.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

/// Seamlessly animates the Icon color when switching color dots
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
