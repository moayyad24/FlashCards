import 'package:flashcards/features/settings/ui/widgets/question_amount_per_test.dart';
import 'package:flashcards/features/settings/ui/widgets/settings_section_title.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              StudySetting(),
              QuestionAmountPerTest(),
              SettingsSectionTitle(title: 'Progress'),
              ListTile(title: Text('Reset progress')),
            ],
          ),
        ),
      ),
    );
  }
}
