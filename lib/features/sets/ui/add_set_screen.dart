import 'package:flashcards/features/home/ui/widgets/add_folder_set_body.dart';
import 'package:flashcards/features/sets/ui/widgets/add_set_floating_action_button.dart';
import 'package:flutter/material.dart';

class AddSetScreen extends StatefulWidget {
  final int folderId;
  const AddSetScreen({super.key, required this.folderId});

  @override
  State<AddSetScreen> createState() => _AddSetScreenState();
}

class _AddSetScreenState extends State<AddSetScreen> {
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
      floatingActionButton: AddSetFloatingActionButton(
          formKey: _formKey,
          folderId: widget.folderId,
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
