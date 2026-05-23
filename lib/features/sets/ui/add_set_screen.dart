import 'package:cardy/core/helper/collection_type.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/core/widgets/custom_input_field.dart';
import 'package:cardy/core/widgets/edit_bottom_bar.dart';
import 'package:cardy/core/widgets/visual_identity_card.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final CollectionType _selectedType = CollectionType.sets;
  Color _selectedColor = const Color(0xFFADC6FF);
  IconData _selectedIcon = Icons.grid_view_rounded;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    super.initState();
  }

  String _iconToDb(IconData icon) {
    return icon.codePoint.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new set'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
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
                  label: 'Description (Optional)',
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
                      _selectedIcon = icon;
                    });
                  },
                  selectedType: _selectedType,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: EditBottomBar(
        title: 'Create Set',
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            final newSet = SetModel(
              id: 0,
              title: _titleController.text,
              description: _descController.text,
              color: _selectedColor,
              icon: _iconToDb(_selectedIcon),
              folderId: widget.folderId,
              numOfCards: 0,
            );
            await BlocProvider.of<SetsCubit>(context).insertAnewSet(newSet);
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
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
