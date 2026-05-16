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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChooseToggleButton(
                onOptionChanged: (selectedOption) {
                  if (selectedOption == ToggleOption.sets) {
                    print("User selected: New Set");
                  } else {
                    print("User selected: New Bundle");
                  }
                },
              ),
              30.verticalSpace,
              const CustomInputField(
                label: 'Title',
                hintText: 'e.g. English Phrases',
              ),
              const SizedBox(height: 20),
              const CustomInputField(
                label: 'Description (Optional)',
                hintText: "Explain what's inside this study set...",
                maxLines: 4,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 20),
              VisualIdentityCard(onIdentityChanged: (c, i) {
                print(c);
                print(i);
              })
            ],
          ),
        ),
      ),
    );
  }
}
