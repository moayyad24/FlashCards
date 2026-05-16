import 'package:cardy/core/widgets/custom_input_field.dart';
import 'package:cardy/features/home/ui/widgets/choose_toggle_button.dart';
import 'package:cardy/features/home/ui/widgets/visual_identity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFolderSetBody extends StatelessWidget {
  const AddFolderSetBody({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController descController,
    this.onOptionChanged,
    this.onIdentityChanged,
  })  : _formKey = formKey,
        _titleController = titleController,
        _descController = descController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _titleController;
  final TextEditingController _descController;
  final ValueChanged<ToggleOption>? onOptionChanged;
  final void Function(Color color, IconData icon)? onIdentityChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChooseToggleButton(
                onOptionChanged: onOptionChanged ?? (_) {},
              ),
              30.verticalSpace,
              CustomInputField(
                label: 'Title',
                hintText: 'e.g. English Phrases',
                controller: _titleController,
              ),
              const SizedBox(height: 20),
              CustomInputField(
                label: 'Description (Optional)',
                hintText: "Explain what's inside this study set...",
                maxLines: 4,
                textInputAction: TextInputAction.done,
                controller: _descController,
              ),
              const SizedBox(height: 20),
              VisualIdentityCard(
                onIdentityChanged: onIdentityChanged ?? (_, __) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
