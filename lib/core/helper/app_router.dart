import 'package:flashcards/core/helper/dependency_injection.dart';
import 'package:flashcards/core/helper/routes.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards_list/data/repo/cards_repo_impl.dart';
import 'package:flashcards/features/cards_list/manager/card_list_cubit/card_list_cubit.dart';
import 'package:flashcards/features/cards_list/manager/edit_card_cubit/edit_card_cubit.dart';
import 'package:flashcards/features/cards_list/manager/edit_set_cubit/edit_set_cubit.dart';
import 'package:flashcards/features/cards_list/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:flashcards/features/cards_list/ui/add_new_card_screen.dart';
import 'package:flashcards/features/cards_list/ui/cards_list_screen.dart';
import 'package:flashcards/features/cards_list/ui/edit_card_screen.dart';
import 'package:flashcards/features/cards_list/ui/edit_set_screen.dart';
import 'package:flashcards/features/home/ui/add_folder_set_screen.dart';
import 'package:flashcards/features/home/ui/home_screen.dart';
import 'package:flashcards/features/sets/data/repo/sets_repo_impl.dart';
import 'package:flashcards/features/sets/manager/edit_folder_cubit/edit_folder_cubit.dart';
import 'package:flashcards/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flashcards/features/sets/ui/add_set_screen.dart';
import 'package:flashcards/features/sets/ui/edit_folder_screen.dart';
import 'package:flashcards/features/sets/ui/sets_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return _buildHomeScreenRoute();
      case Routes.addFolderSetScreen:
        return _buildAddFolderSetScreenRoute(settings.arguments as int);
      case Routes.cardsListScreen:
        return _buildCardsListScreenRoute(
            settings.arguments as CollectionModel);
      case Routes.setsListScreen:
        return _buildSetsListScreenRoute(settings.arguments as CollectionModel);
      case Routes.addSetScreen:
        return _buildAddSetScreenRoute(
            settings.arguments as Map<String, dynamic>);
      case Routes.addNewCardScreen:
        return _buildAddNewCardScreenRoute(
            settings.arguments as Map<String, dynamic>);
      case Routes.editCardScreen:
        return _buildEditCardScreenRoute(
            settings.arguments as Map<String, dynamic>);
      case Routes.editSetScreen:
        return _buildEditSetScreenRoute(
            settings.arguments as Map<String, dynamic>);
      case Routes.editFolderScreen:
        return _buildEditFolderScreenRoute(
            settings.arguments as Map<String, dynamic>);
      default:
        return _buildDefaultRoute(settings.name!);
    }
  }

  Route _buildHomeScreenRoute() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    );
  }

  Route _buildAddFolderSetScreenRoute(int argument) {
    return MaterialPageRoute(
      builder: (_) => const AddFolderSetScreen(),
      settings: RouteSettings(arguments: argument),
    );
  }

  Route _buildCardsListScreenRoute(CollectionModel argument) {
    return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SelectInListBloc(),
          ),
          BlocProvider(
            create: (_) => CardListCubit(getIt.get<CardsRepoImpl>())
              ..initSetModel(argument)
              ..fetchCards(),
          ),
        ],
        child: const CardsListScreen(),
      ),
    );
  }

  Route _buildSetsListScreenRoute(CollectionModel argument) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => SetsCubit(SetsRepoImpl())
          ..initFolderModel(argument)
          ..fetchAllSets(),
        child: const SetsListScreen(),
      ),
    );
  }

  Route _buildAddSetScreenRoute(Map<String, dynamic> data) {
    int folderId = data['folderId'];
    SetsCubit setsCubit = data['setsCubit'];
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: setsCubit,
        child: AddSetScreen(folderId: folderId),
      ),
    );
  }

  Route _buildAddNewCardScreenRoute(Map<String, dynamic> data) {
    int setId = data['setId'];
    CardListCubit cardListCubit = data['cardListCubit'];
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: cardListCubit,
        child: AddNewCardScreen(setId: setId),
      ),
    );
  }

  Route _buildEditCardScreenRoute(Map<String, dynamic> data) {
    CardModel cardModel = data['cardModel'];
    CardListCubit cardListCubit = data['cardListCubit'];
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: cardListCubit,
        child: BlocProvider(
          create: (_) => EditCardCubit(getIt.get<CardsRepoImpl>())
            ..initializeController(cardModel),
          child: EditCardScreen(cardModel: cardModel),
        ),
      ),
    );
  }

  Route _buildEditSetScreenRoute(Map<String, dynamic> data) {
    CollectionModel setModel = data['setModel'];
    CardListCubit cardListCubit = data['cardListCubit'];

    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: cardListCubit,
        child: BlocProvider(
          create: (context) => EditSetCubit(getIt.get<CardsRepoImpl>()),
          child: EditSetScreen(setModel: setModel),
        ),
      ),
    );
  }

  Route _buildEditFolderScreenRoute(Map<String, dynamic> data) {
    CollectionModel folderModel = data['folderModel'];
    SetsCubit setsCubit = data['setsCubit'];
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: setsCubit,
        child: BlocProvider(
          create: (context) => EditFolderCubit(getIt.get<SetsRepoImpl>()),
          child: EditFolderScreen(folderModel: folderModel),
        ),
      ),
    );
  }

  Route _buildDefaultRoute(String routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for $routeName'),
        ),
      ),
    );
  }
}
