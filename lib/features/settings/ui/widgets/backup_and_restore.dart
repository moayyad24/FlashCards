import 'package:flashcards/features/home/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/settings/ui/widgets/settings_section_title.dart';
import 'package:flashcards/features/settings/manager/settings_cubit/settings_cubit.dart';

class BackupAndRestore extends StatelessWidget {
  const BackupAndRestore({
    super.key,
  });
  final String note = '''
1. Open your file manager app on your phone (look for “Files,” “My Files,” etc.).
2. Go to your internal storage (this may be labeled "Internal Storage" or "Phone Storage").
3. Find the folder named “Cardy.”
4. Send the “Cardy” folder to your second phone.
5. On your second phone, open the file manager app.
6. Go to its internal storage.
7. Paste the “Cardy” folder there.
8. Open the app on your second phone.
9. Go to settings and tap the “Restore” button.
10. Follow any additional prompts to finish restoring your data.''';
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
          onTap: () async {
            await context.read<SettingsCubit>().restoreDatabase();
            if (context.mounted) {
              context.read<SettingsCubit>().fetchSettings();
              context.read<HomeCubit>().homeFetchData();
            }
          },
          title: const Text('Restore'),
          subtitle: const Text('Restore your cards from your local storage'),
          subtitleTextStyle: const TextStyle(color: AppColors.greyLight),
          trailing: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text(
                        'How to Restore Your Data from Another Phone:'),
                    content: Text(note),
                  );
                },
              );
            },
            child: const Icon(Icons.help_outline),
          ),
        ),
      ],
    );
  }
}
