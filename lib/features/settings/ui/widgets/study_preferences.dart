import 'package:cardy/features/settings/manager/settings_cubit/settings_cubit.dart';
import 'package:cardy/features/settings/ui/widgets/question_amount_per_test.dart';
import 'package:cardy/features/settings/ui/widgets/settings_section.dart';
import 'package:cardy/features/settings/ui/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudyPreferences extends StatelessWidget {
  const StudyPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'STUDY PREFERENCES',
      child: Column(
        children: [
          SettingsListTile(
            icon: Icons.shuffle,
            title: 'Randomization',
            subtitle: 'Randomize cards in a test',
            value: context.read<SettingsCubit>().settingsModel.randomization,
            updateValue: (value) async {
              return await context
                  .read<SettingsCubit>()
                  .updateRandomization(value);
            },
          ),
          const Divider(),
          SettingsListTile(
            icon: Icons.trending_up_rounded,
            title: 'Prioritizing',
            subtitle: 'Prioritize non-reviewed over re-reviewed questions',
            value: context.read<SettingsCubit>().settingsModel.prioritizing,
            updateValue: (value) async {
              return await context
                  .read<SettingsCubit>()
                  .updatePrioritizing(value);
            },
          ),
          const Divider(),
          const QuestionAmountPerTest(),
        ],
      ),
    );
  }
}
