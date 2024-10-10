import 'package:flashcards/features/cards/data/repo/cards_repo_impl.dart';
import 'package:flashcards/features/home/data/repo/home_repo_impl.dart';
import 'package:flashcards/features/sets/data/repo/sets_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //Home
  getIt.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl());
  //Sets
  getIt.registerLazySingleton<SetsRepoImpl>(() => SetsRepoImpl());
  //Cards
  getIt.registerLazySingleton<CardsRepoImpl>(() => CardsRepoImpl());
}
