import 'package:flashcards/features/settings/manager/settings_cubit/settings_cubit.dart';
import 'package:flashcards/features/settings/ui/widgets/settings_section_title.dart';
import 'package:flashcards/features/settings/ui/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudySetting extends StatelessWidget {
  const StudySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionTitle(title: 'Study setting'),
        SettingsListTile(
          title: 'Randomization',
          subtitle: 'Randomize cards in a test',
          value: context.read<SettingsCubit>().settingsModel?.randomization ??
              false,
          updateValue: (value) async {
            return await context
                .read<SettingsCubit>()
                .updateRandomization(value);
          },
        ),
        SettingsListTile(
          title: 'Prioritizing',
          subtitle: 'Prioritize non-reviewed over re-reviewed questions',
          value: context.read<SettingsCubit>().settingsModel?.prioritizing ??
              false,
          updateValue: (value) async {
            return await context
                .read<SettingsCubit>()
                .updatePrioritizing(value);
          },
        ),
      ],
    );
  }
}
