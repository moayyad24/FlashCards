import 'package:cardy/core/helper/collection_type.dart';
import 'package:cardy/core/helper/dependency_injection.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/widgets/custom_input_field.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards/manager/edit_set_cubit/edit_set_cubit.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:cardy/core/widgets/visual_identity_card.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:cardy/core/widgets/edit_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSetScreen extends StatefulWidget {
  final SetModel setModel;
  const EditSetScreen({super.key, required this.setModel});

  @override
  State<EditSetScreen> createState() => _EditSetScreenState();
}

class _EditSetScreenState extends State<EditSetScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _titleController;
  late TextEditingController _descController;
  final CollectionType _selectedType = CollectionType.sets;
  late Color _selectedColor;
  late String _selectedIcon;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _titleController.text = widget.setModel.title;
    _descController.text = widget.setModel.description;
    _selectedColor = widget.setModel.color;
    _selectedIcon = widget.setModel.icon;
    super.initState();
  }

  Future<void> _onConfirm(BuildContext context) async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    SetModel setModel = SetModel(
      id: widget.setModel.id,
      title: _titleController.text,
      description: _descController.text,
      color: _selectedColor,
      icon: _selectedIcon,
      folderId: widget.setModel.folderId,
      numOfCards: widget.setModel.numOfCards,
    );

    var cardListCubit = context.read<CardsListCubit>();
    var editSetCubit = context.read<EditSetCubit>();
    var homeCubit = context.read<HomeCubit>();
    cardListCubit.editSetModel(setModel);
    await editSetCubit.updateSet(setModel);
    if (setModel.folderId > 0) {
      var setsCubit = getIt<SetsCubit>();
      await setsCubit.fetchAllSets();
    } else {
      await homeCubit.homeFetchData();
    }

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Set',
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
                ),
                const SizedBox(height: 20),
                VisualIdentityCard(
                  onIdentityChanged: (color, icon) {
                    setState(() {
                      _selectedColor = color;
                      _selectedIcon = icon.codePoint.toString();
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
