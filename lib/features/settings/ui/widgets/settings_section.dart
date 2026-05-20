import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/settings/ui/widgets/settings_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final Widget child;
  const SettingsSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsSectionTitle(title: title),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6).r,
          decoration: BoxDecoration(
            color: AppColors.grey272A31,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(
              width: 1.5,
              color: AppColors.border424754,
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
