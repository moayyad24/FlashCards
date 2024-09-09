import 'package:flashcards/core/theme/app_theme.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FlashCards());
}

class FlashCards extends StatelessWidget {
  const FlashCards({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: AppColors.black));
    return MaterialApp(
      title: 'FlashCards',
      darkTheme: AppTheme.appTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
