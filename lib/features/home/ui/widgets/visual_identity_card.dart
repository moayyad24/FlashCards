import 'package:cardy/core/helper/collection_type.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/Models/configuration.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
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
  IconData _selectedIcon = Icons.grid_view_rounded;

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

  // Helper method to trigger flutter_iconpicker
  Future<void> _pickIcon() async {
    IconPickerIcon? icon = await showIconPicker(
      context,
      configuration: SinglePickerConfiguration(
        title: Text(
          'Pick an icon',
          style: AppTextStyles.bold18,
        ),
        iconPickerShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        searchComparator: (String search, IconPickerIcon icon) =>
            search
                .toLowerCase()
                .contains(icon.name.replaceAll('_', ' ').toLowerCase()) ||
            icon.name.toLowerCase().contains(search.toLowerCase()),
      ),
    );

    if (icon != null) {
      setState(() {
        _selectedIcon = icon.data;
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
