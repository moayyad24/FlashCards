import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
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
          descController: _descController),
      bottomNavigationBar: const CreateNewBottomBar(),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
