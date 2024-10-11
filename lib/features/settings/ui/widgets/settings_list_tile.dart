import 'package:flashcards/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool value;
  const SettingsListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
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
        onChanged: (value) {
          setState(() {
            isActive = value;
          });
        },
      ),
    );
  }
}
