import 'package:flashcards/features/cards/ui/add_new_card_screen.dart';
import 'package:flashcards/features/cards/ui/cards_list_screen.dart';
import 'package:flashcards/features/home/ui/add_folder_set_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String addFolderSet = '/add_folder_set';
  static const String cardsList = '/cards_list';
  static const String addNewCard = '/add_new_card';

  static Map<String, Widget Function(BuildContext)> routes = {
    addFolderSet: (context) => const AddFolderSetScreen(),
    cardsList: (context) => const CardsListScreen(),
    addNewCard: (context) => const AddNewCardScreen(),
  };
}
