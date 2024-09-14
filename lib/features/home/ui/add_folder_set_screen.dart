import 'package:flashcards/features/home/ui/widgets/add_folder_set_body.dart';
import 'package:flashcards/features/home/ui/widgets/add_folder_set_floating_action_button.dart';
import 'package:flutter/material.dart';

class AddFolderSetScreen extends StatefulWidget {
  const AddFolderSetScreen({super.key});

  @override
  State<AddFolderSetScreen> createState() => _AddFolderSetScreenState();
}

class _AddFolderSetScreenState extends State<AddFolderSetScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new set'),
      ),
      floatingActionButton: AddFolderSetFloatingActionButton(
          formKey: _formKey,
          titleController: _titleController,
          descController: _descController),
      body: AddFolderSetBody(
          formKey: _formKey,
          titleController: _titleController,
          descController: _descController),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
