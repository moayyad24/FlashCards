import 'package:flashcards/features/settings/ui/widgets/question_amount_per_test.dart';
import 'package:flashcards/features/settings/ui/widgets/backup_and_restore.dart';
import 'package:flashcards/features/settings/ui/widgets/study_setting.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Settings',
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
      )),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StudySetting(),
              QuestionAmountPerTest(),
              BackupAndRestore(),
            ],
          ),
        ),
      ),
    );
  }
}
