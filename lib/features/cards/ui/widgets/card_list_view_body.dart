import 'package:flashcards/features/cards/data/models/card_model.dart';
import 'package:flashcards/features/cards/ui/widgets/card_list_tile.dart';
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
