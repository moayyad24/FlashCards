import 'package:flashcards/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
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
        await context.read<CardsListCubit>().updateIsStudiedCard(
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
