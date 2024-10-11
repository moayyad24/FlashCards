import 'package:flashcards/features/settings/ui/widgets/question_amount_per_test.dart';
import 'package:flashcards/features/settings/ui/widgets/settings_section_title.dart';
import 'package:flashcards/features/settings/ui/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SettingsSectionTitle(title: 'Study setting'),
              SettingsListTile(
                title: 'Randomization',
                subtitle: 'Randomize cards in a test',
                value: false,
              ),
              SettingsListTile(
                title: 'Prioritizing',
                subtitle: 'Prioritize non-reviewed over re-reviewed questions',
                value: false,
              ),
              QuestionAmountPerTest(),
              SettingsSectionTitle(title: 'Progress'),
              ListTile(
                title: Text('Reset progress'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

