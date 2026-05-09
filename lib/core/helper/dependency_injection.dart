import 'package:cardy/features/cards/data/repo/cards_repo_impl.dart';
import 'package:cardy/features/home/data/repo/home_repo_impl.dart';
import 'package:cardy/features/sets/data/repo/sets_repo_impl.dart';
import 'package:cardy/features/settings/data/repo/settings_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;
final logger = Logger(printer: PrettyPrinter(colors: true, printEmojis: true));
void setupGetIt() {
  //Home
  getIt.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl());
  //Sets
  getIt.registerLazySingleton<SetsRepoImpl>(() => SetsRepoImpl());
  //Cards
  getIt.registerLazySingleton<CardsRepoImpl>(() => CardsRepoImpl());
  //Settings
  getIt.registerLazySingleton<SettingsRepoImpl>(() => SettingsRepoImpl());
}
