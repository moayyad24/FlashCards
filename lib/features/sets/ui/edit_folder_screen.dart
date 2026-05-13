import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/widgets/app_text_field.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:cardy/features/sets/manager/edit_folder_cubit/edit_folder_cubit.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFolderScreen extends StatefulWidget {
  final FolderModel folderModel;
  const EditFolderScreen({super.key, required this.folderModel});

  @override
  State<EditFolderScreen> createState() => _EditFolderScreenState();
}

class _EditFolderScreenState extends State<EditFolderScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _titleController.text = widget.folderModel.title;
    _descController.text = widget.folderModel.description;
    super.initState();
  }

  Future<void> onConfirm(BuildContext context) async {
    FolderModel folderModel = FolderModel(
      id: widget.folderModel.id,
      title: _titleController.text,
      description: _descController.text,
      numOfSets: widget.folderModel.numOfSets,
      numOfCards: widget.folderModel.numOfCards,
    );
    var setsCubit = context.read<SetsCubit>();
    var editSetCubit = context.read<EditFolderCubit>();
    var homeCubit = context.read<HomeCubit>();
    setsCubit.editFolderModel(folderModel);
    await editSetCubit.updateFolder(folderModel);
    await homeCubit.homeFetchData();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new set'),
        actions: [
          IconButton(
            onPressed: () async {
              await onConfirm(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
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
