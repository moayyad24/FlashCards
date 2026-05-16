import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/helper/collection_type.dart';
import 'package:cardy/features/home/ui/widgets/choose_toggle_button.dart';
import 'package:cardy/features/home/ui/widgets/add_folder_set_body.dart';
import 'package:cardy/features/home/ui/widgets/create_new_bottom_bar.dart';
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
  CollectionType _selectedType = CollectionType.sets;
  Color _selectedColor = const Color(0xFFADC6FF);
  IconData _selectedIcon = Icons.grid_view_rounded;

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
        title: Text(
          'Create New',
          style: AppTextStyles.bold28.copyWith(color: AppColors.blueADC6FF),
        ),
      ),
      body: AddFolderSetBody(
        formKey: _formKey,
        titleController: _titleController,
        descController: _descController,
        onOptionChanged: (selectedOption) {
          setState(() {
            _selectedType = selectedOption == ToggleOption.sets
                ? CollectionType.sets
                : CollectionType.folder;
          });
        },
        selectedType: _selectedType,
        onIdentityChanged: (color, icon) {
          setState(() {
            _selectedColor = color;
            _selectedIcon = icon;
          });
        },
      ),
      bottomNavigationBar: CreateNewBottomBar(
        formKey: _formKey,
        titleController: _titleController,
        descController: _descController,
        selectedType: _selectedType,
        selectedColor: _selectedColor,
        selectedIcon: _selectedIcon,
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
