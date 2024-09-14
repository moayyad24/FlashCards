import 'package:flashcards/features/home/data/model/set_model.dart';
import 'package:flashcards/features/home/manager/sets_cubit.dart/sets_cubit.dart';
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
    return FloatingActionButton(
      onPressed: () async {
        if (_formKey.currentState?.validate() ?? false) {
          final newSet = SetModel(
            title: _titleController.text,
            description: _descController.text,
            folderId: 0,
            createdAt: DateTime.now().toString(),
          );
          await BlocProvider.of<SetsCubit>(context).insertAnewSet(newSet);
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
        print(myInt);
      },
      child: const Icon(Icons.check),
    );
  }
}
