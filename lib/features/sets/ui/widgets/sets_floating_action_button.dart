import 'package:flashcards/core/helper/routes.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetsFloatingActionButton extends StatelessWidget {
  const SetsFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.black,
          isScrollControlled: true,
          builder: (BuildContext ctx) {
            return SizedBox(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushNamed(Routes.addSetScreen, arguments: {
                    'folderId': context.read<SetsCubit>().folderModel.folderId!,
                    'setsCubit': BlocProvider.of<SetsCubit>(context),
                  });
                },
                leading: const Icon(Icons.folder),
                title: const Text('Create new study set'),
              ), // Set height of Bottom Sheet
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
