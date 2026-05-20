import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/features/settings/ui/widgets/backup_and_restore.dart';
import 'package:cardy/features/settings/ui/widgets/study_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Settings',
        style: AppTextStyles.bold24,
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0).r,
            child: const Column(
              children: [
                StudyPreferences(),
                BackupAndRestore(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
