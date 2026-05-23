import 'package:cardy/core/helper/collection_type.dart';
import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/widgets/custom_input_field.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:cardy/core/widgets/visual_identity_card.dart';
import 'package:cardy/features/sets/manager/edit_folder_cubit/edit_folder_cubit.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:cardy/core/widgets/edit_bottom_bar.dart';
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
  final CollectionType _selectedType = CollectionType.folder;
  late Color _selectedColor;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _titleController.text = widget.folderModel.title;
    _descController.text = widget.folderModel.description;
    _selectedColor = widget.folderModel.color;
    super.initState();
  }

  Future<void> _onConfirm(BuildContext context) async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    FolderModel folderModel = FolderModel(
      id: widget.folderModel.id,
      title: _titleController.text,
      description: _descController.text,
      color: _selectedColor,
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
        title: Text(
          'Edit Folder',
          style: AppTextStyles.bold22.copyWith(color: AppColors.blueADC6FF),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomInputField(
                  label: 'Title',
                  hintText: 'e.g. English Phrases',
                  controller: _titleController,
                  maxLength: 20,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  label: 'Description',
                  hintText: "Explain what's inside this study set...",
                  maxLines: 4,
                  textInputAction: TextInputAction.done,
                  controller: _descController,
                  maxLength: 100,
                ),
                const SizedBox(height: 20),
                VisualIdentityCard(
                  onIdentityChanged: (color, icon) {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  selectedType: _selectedType,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: EditBottomBar(
        title: 'Apply Changes',
        onPressed: () async {
          await _onConfirm(context);
        },
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
