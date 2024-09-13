import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashcards/core/widgets/app_text_field.dart';
import 'package:flashcards/features/home/data/model/set_model.dart';
import 'package:flashcards/features/home/manager/sets_cubit.dart/sets_cubit.dart';

class AddFolderSetScreen extends StatefulWidget {
  const AddFolderSetScreen({super.key});

  @override
  State<AddFolderSetScreen> createState() => _AddFolderSetScreenState();
}

class _AddFolderSetScreenState extends State<AddFolderSetScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new set'),
      ),
      floatingActionButton: FloatingActionButton(
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
        },
        child: const Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                controller: _titleController,
                hintText: 'Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AppTextField(
                controller: _descController,
                hintText: 'Description',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
