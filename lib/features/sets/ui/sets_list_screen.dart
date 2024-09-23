import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/sets/ui/widgets/card_list_view.dart';
import 'package:flashcards/features/sets/ui/widgets/sets_floating_action_button.dart';
import 'package:flashcards/features/sets/ui/widgets/sets_list_screen_title.dart';
import 'package:flutter/material.dart';

class SetsListScreen extends StatelessWidget {
  final CollectionModel folder;
  const SetsListScreen({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
              )),
        ],
      ),
      floatingActionButton: SetsFloatingActionButton(folder: folder),
      body: Column(
        children: [
          SetsListScreenTitle(title: folder.title),
          const CardsListView(),
        ],
      ),
    ));
  }
}
