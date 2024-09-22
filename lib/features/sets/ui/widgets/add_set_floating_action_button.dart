import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSetFloatingActionButton extends StatelessWidget {
  const AddSetFloatingActionButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required int folderId,
    required TextEditingController titleController,
    required TextEditingController descController,
  })  : _formKey = formKey,
        _folderId = folderId,
        _titleController = titleController,
        _descController = descController;

  final GlobalKey<FormState> _formKey;
  final int _folderId;
  final TextEditingController _titleController;
  final TextEditingController _descController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        if (_formKey.currentState?.validate() ?? false) {
          final newSet = CollectionModel(
            title: _titleController.text,
            description: _descController.text,
            folderId: _folderId,
          );
          await BlocProvider.of<SetsCubit>(context).insertAnewSet(newSet);
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: const Icon(Icons.check),
    );
  }
}
