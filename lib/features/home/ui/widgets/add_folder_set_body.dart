import 'package:flashcards/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class AddFolderSetBody extends StatelessWidget {
  const AddFolderSetBody({
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
    return Padding(
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
    );
  }
}
