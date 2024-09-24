import 'package:flashcards/core/helper/app_router.dart';
import 'package:flashcards/core/helper/dependency_injection.dart';
import 'package:flashcards/core/helper/simple_bloc_observer.dart';
import 'package:flashcards/core/theme/app_theme.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/home/data/repo/home_repo_impl.dart';
import 'package:flashcards/features/home/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupGetIt();
  Bloc.observer = SimpleBlocObserver();
  runApp(FlashCards(
    appRouter: AppRouter(),
  ));
}

class FlashCards extends StatelessWidget {
  final AppRouter appRouter;
  const FlashCards({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: AppColors.black));
    return BlocProvider(
      create: (context) =>
          HomeCubit(getIt.get<HomeRepoImpl>())..homeFetchDate(),
      child: MaterialApp(
        title: 'FlashCards',
        darkTheme: AppTheme.appTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
