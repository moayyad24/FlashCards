import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/settings/manager/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsListTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final Future<int> Function(bool) updateValue;
  const SettingsListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.updateValue,
  });

  @override
  State<SettingsListTile> createState() => _SettingsListTileState();
}

class _SettingsListTileState extends State<SettingsListTile> {
  bool isActive = false;
  @override
  void initState() {
    isActive = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16, right: 12).r,
      leading: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: AppColors.grey1D2127,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            widget.icon,
            color: AppColors.blueADC6FF,
          ),
        ),
      ),
      title: Text(widget.title),
      titleTextStyle: AppTextStyles.bold16,
      subtitle: Text(widget.subtitle),
      subtitleTextStyle: AppTextStyles.regular12,
      trailing: Switch(
        value: isActive,
        inactiveTrackColor: AppColors.darkblue10131A,
        onChanged: (value) async {
          SettingsCubit cubit = context.read<SettingsCubit>();
          int result = await widget.updateValue(value);
          if (result > 0) {
            await cubit.fetchSettings();
            setState(() {
              isActive = value;
            });
          }
        },
      ),
    );
  }
}
