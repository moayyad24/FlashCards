import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/helper/collection_type.dart';
import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewBottomBar extends StatelessWidget {
  const CreateNewBottomBar({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController descController,
    required CollectionType selectedType,
    required Color selectedColor,
    required IconData selectedIcon,
  })  : _formKey = formKey,
        _titleController = titleController,
        _descController = descController,
        _selectedType = selectedType,
        _selectedColor = selectedColor,
        _selectedIcon = selectedIcon;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _titleController;
  final TextEditingController _descController;
  final CollectionType _selectedType;
  final Color _selectedColor;
  final IconData _selectedIcon;

  String _iconToDb(IconData icon) {
    return icon.codePoint.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff10131a),
          border:
              Border(top: BorderSide(color: AppColors.border1C1F26, width: 2))),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: SafeArea(
        child: SizedBox(
          height: 50.h,
          child: ElevatedButton(
            onPressed: () async {
              if (!(_formKey.currentState?.validate() ?? false)) {
                return;
              }

              if (_selectedType == CollectionType.sets) {
                final newSet = SetModel(
                  id: 0,
                  title: _titleController.text,
                  description: _descController.text,
                  color: _selectedColor,
                  icon: _iconToDb(_selectedIcon),
                  folderId: 0,
                );
                await context.read<HomeCubit>().insertAnewSet(newSet);
              } else {
                final newFolder = FolderModel(
                  id: 0,
                  title: _titleController.text,
                  description: _descController.text,
                  color: _selectedColor,
                );
                await context.read<HomeCubit>().insertAnewFolder(newFolder);
              }

              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueADC6FF,
              foregroundColor: AppColors.purple2B2148,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: 22.w,
                ),
                const SizedBox(width: 8),
                Text(
                  _selectedType == CollectionType.sets
                      ? 'Create Set'
                      : 'Create Folder',
                  style: AppTextStyles.medium16
                      .copyWith(color: AppColors.purple2B2148),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
