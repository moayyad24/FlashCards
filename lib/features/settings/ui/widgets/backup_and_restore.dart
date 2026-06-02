import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:cardy/features/settings/ui/widgets/settings_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cardy/features/settings/manager/settings_cubit/settings_cubit.dart';

class BackupAndRestore extends StatelessWidget {
  const BackupAndRestore({
    super.key,
  });
  final String note = '''
• On your old phone, tap 'Backup'
• Locate the backup file in your device storage
• Copy the file to your new phone's Internal Storage
• Open Cardy on your new phone
• Tap 'Restore' and select your backup file
• All done - your data is now transferred!
''';
  @override
  Widget build(BuildContext context) {
    return SettingsSection(
        title: 'BACKUP AND RESTORE',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                context.read<SettingsCubit>().backupDatabase();
              },
              title: const Text('Backup'),
              titleTextStyle: AppTextStyles.bold16,
              subtitle: const Text('Backup your cards into your local storage'),
              subtitleTextStyle: AppTextStyles.regular12,
              trailing: const Icon(Icons.backup_outlined),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      title: Text('Restore Data', style: AppTextStyles.bold16),
                      content: Text(
                          'Are you sure you want to restore? This will OVERWRITE your current folders and sets.',
                          style: AppTextStyles.medium12),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(dialogContext);
                            await context
                                .read<SettingsCubit>()
                                .restoreDatabase();
                            if (context.mounted) {
                              context.read<SettingsCubit>().fetchSettings();
                              context.read<HomeCubit>().homeFetchData();
                            }
                          },
                          child: const Text('Restore'),
                        ),
                      ],
                    );
                  },
                );
              },
              title: const Text('Restore'),
              titleTextStyle: AppTextStyles.bold16,
              subtitle:
                  const Text('Restore your cards from your local storage'),
              subtitleTextStyle: AppTextStyles.regular12,
              trailing: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text(
                          'How to transfer your data to a new phone:',
                          style: AppTextStyles.bold16,
                        ),
                        content: Text(
                          note,
                          style: AppTextStyles.medium14,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(_),
                            child: const Text('Got it'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Icon(Icons.help_outline),
              ),
            ),
          ],
        ));
  }
}
