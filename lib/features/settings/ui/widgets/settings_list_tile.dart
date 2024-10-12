import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/settings/manager/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool value;
  final Future<int> Function(bool) updateValue;
  const SettingsListTile({
    super.key,
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
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      subtitleTextStyle: const TextStyle(color: AppColors.greyLight),
      trailing: Switch(
        value: isActive,
        inactiveTrackColor: AppColors.grey,
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
