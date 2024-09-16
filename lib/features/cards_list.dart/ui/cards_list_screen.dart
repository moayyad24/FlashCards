import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/cards_list.dart/ui/widgets/card_list_view_body.dart';
import 'package:flashcards/features/cards_list.dart/ui/widgets/cards_list_floating_action_button.dart';
import 'package:flutter/material.dart';

class CardsListScreen extends StatelessWidget {
  const CardsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as CollectionModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.title,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: const CardsListsFloatingActionButton(),
      body: const CardListViewBody(),
    );
  }
}
