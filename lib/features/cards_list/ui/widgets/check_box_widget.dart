import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/core/models/card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key, required this.cardModel});

  final CardModel cardModel;

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.cardModel.isStudied,
      onChanged: (value) async {
        await context.read<CardListCubit>().updateIsStudiedCard(
              widget.cardModel.id!,
              value!,
            );
        setState(() {
          widget.cardModel.isStudied = value;
        });
      },
    );
  }
}
