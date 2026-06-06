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
        style: TextStyle(
            fontSize: 1.sw > 760 ? 42 : 28, fontWeight: FontWeight.bold),
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
