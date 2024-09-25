import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/core/widgets/app_text_field.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards_list/manager/edit_set_cubit/edit_set_cubit.dart';
import 'package:flashcards/features/home/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSetScreen extends StatefulWidget {
  final CollectionModel setModel;
  const EditSetScreen({super.key, required this.setModel});

  @override
  State<EditSetScreen> createState() => _EditSetScreenState();
}

class _EditSetScreenState extends State<EditSetScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _titleController.text = widget.setModel.title;
    _descController.text = widget.setModel.description;
    super.initState();
  }

  Future<void> onConfirm(BuildContext context) async {
    CollectionModel setModel = CollectionModel(
      title: _titleController.text,
      description: _descController.text,
      setId: widget.setModel.setId,
    );

    var cardListCubit = context.read<CardListCubit>();
    var editSetCubit = context.read<EditSetCubit>();
    var homeCubit = context.read<HomeCubit>();

    cardListCubit.editSetModel(setModel);
    await editSetCubit.updateSet(setModel);
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
