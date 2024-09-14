import 'package:flashcards/core/helper/simple_bloc_observer.dart';
import 'package:flashcards/core/theme/app_theme.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/home/data/repo/home_repo_impl.dart';
import 'package:flashcards/features/home/manager/sets_cubit.dart/sets_cubit.dart';
import 'package:flashcards/features/home/ui/add_folder_set_screen.dart';
import 'package:flashcards/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const FlashCards());
}

class FlashCards extends StatelessWidget {
  const FlashCards({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: AppColors.black));
    return BlocProvider(
      create: (context) => SetsCubit(HomeRepoImpl())..fetchAllSets(),
      child: MaterialApp(
        title: 'FlashCards',
        darkTheme: AppTheme.appTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          '/addFolderSet': (context) => const AddFolderSetScreen(),
        },
      ),
    );
  }
}
