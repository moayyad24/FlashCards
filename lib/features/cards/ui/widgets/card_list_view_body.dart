import 'package:flashcards/features/cards/data/models/card_model.dart';
import 'package:flutter/material.dart';

class CardListViewBody extends StatelessWidget {
  const CardListViewBody({
    super.key,
    required List<CardModel> cardList,
  }) : _cardList = cardList;
  final List<CardModel> _cardList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _cardList.length,
        itemBuilder: (context, index) {
          return CardListTile(
            cardModel: _cardList[index],
          );
        });
  }
}

class CardListTile extends StatelessWidget {
  const CardListTile({
    super.key,
    required CardModel cardModel,
  }) : _cardModel = cardModel;
  final CardModel _cardModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.format_line_spacing),
      title: Text(_cardModel.question),
      subtitle: Text(_cardModel.answer),
    );
  }
}
