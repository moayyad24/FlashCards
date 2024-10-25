import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/settings/ui/widgets/settings_section_title.dart';
import 'package:flashcards/features/settings/manager/settings_cubit/settings_cubit.dart';

class BackupAndRestore extends StatelessWidget {
  const BackupAndRestore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionTitle(title: 'Backup and Restore'),
        ListTile(
          onTap: () {
            context.read<SettingsCubit>().backupDatabase();
          },
          title: const Text('Backup'),
          subtitle: const Text('Backup your cards to your local storage'),
          subtitleTextStyle: const TextStyle(color: AppColors.greyLight),
          trailing: const Icon(Icons.backup_outlined),
        ),
        ListTile(
          onTap: () {
            context.read<SettingsCubit>().restoreDatabase();
          },
          title: const Text('Restore'),
          subtitle: const Text('Restore your cards from your local storage'),
          subtitleTextStyle: const TextStyle(color: AppColors.greyLight),
          trailing: const Icon(Icons.settings_backup_restore_rounded),
        ),
      ],
    );
  }
}
