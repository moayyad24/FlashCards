import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/home/ui/add_folder_set_screen.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.black,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const AddFolderSetScreen();
                      }));
                    },
                    leading: const Icon(Icons.folder),
                    title: const Text('Create new study set'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.folder_copy),
                    title: const Text('Create new bundle of set'),
                  ),
                ],
              ), // Set height of Bottom Sheet
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
