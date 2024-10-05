import 'package:flashcards/core/models/card_model.dart';
import 'package:flutter/material.dart';

class ResultCardListTile extends StatelessWidget {
  const ResultCardListTile({
    super.key,
    required this.cardModel,
  });

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.reorder),
      title: Text(cardModel.question),
      subtitle: Text(cardModel.answer),
      titleTextStyle: const TextStyle(overflow: TextOverflow.ellipsis),
      subtitleTextStyle: const TextStyle(overflow: TextOverflow.ellipsis),
      trailing: Checkbox(
        value: cardModel.isStudied,
        onChanged: (value) {},
      ),
    );
  }
}
