import 'package:flashcards/core/helper/type.dart';
import 'package:flashcards/features/home/data/model/folder_model.dart';
import 'package:flashcards/features/home/data/model/set_model.dart';
import 'package:flashcards/features/home/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFolderSetFloatingActionButton extends StatelessWidget {
  const AddFolderSetFloatingActionButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController descController,
  })  : _formKey = formKey,
        _titleController = titleController,
        _descController = descController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _titleController;
  final TextEditingController _descController;

  @override
  Widget build(BuildContext context) {
    final int myInt = ModalRoute.of(context)?.settings.arguments as int;
    Type type = getType(myInt);
    return FloatingActionButton(
      onPressed: () async {
        if (_formKey.currentState?.validate() ?? false) {
          if (type == Type.sets) {
            final newSet = SetModel(
              title: _titleController.text,
              description: _descController.text,
            );
            await BlocProvider.of<HomeCubit>(context).insertAnewSet(newSet);
          } else {
            final newFolder = FolderModel(
              title: _titleController.text,
              description: _descController.text,
            );
            await BlocProvider.of<HomeCubit>(context)
                .insertAnewFolder(newFolder);
          }
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: const Icon(Icons.check),
    );
  }
}
