import 'package:flashcards/features/cards/ui/cards_list_screen.dart';
import 'package:flashcards/features/home/ui/add_folder_set_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String addFolderSet = '/addFolderSet';
  static const String cardsList = '/cardsList';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/addFolderSet': (context) => const AddFolderSetScreen(),
    '/cardsList': (context) => const CardsListScreen(),
  };
}
