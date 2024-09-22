import 'package:flashcards/features/home/ui/add_folder_set_screen.dart';

import 'package:flutter/material.dart';

class AppRoutes {
  static const String addFolderSet = '/add_folder_set';

  static Map<String, Widget Function(BuildContext)> routes = {
    addFolderSet: (context) => const AddFolderSetScreen(),
  };
}
