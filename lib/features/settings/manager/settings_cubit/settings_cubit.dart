import 'package:flashcards/features/settings/data/model/settings_model.dart';
import 'package:flashcards/features/settings/manager/settings_cubit/settings_state.dart';
import 'package:flashcards/features/settings/data/repo/settings_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo settingsRepo;
  SettingsCubit(this.settingsRepo) : super(SettingsInitial());

  SettingsModel? settingsModel;

  fetchSettings() async {
    emit(SettingsLoading());
    settingsModel = await settingsRepo.fetchSettings();
    emit(SettingsSuccess());
  }

  updateRandomization(bool isRandomization) async {
    int result = await settingsRepo.updateRandomization(isRandomization);
    if (result > 0) {
      debugPrint('----------successfully updated------------');
    } else {
      debugPrint('----------error while updating------------');
    }
    return result;
  }

  updatePrioritizing(bool isPrioritizing) async {
    int result = await settingsRepo.updatePrioritizing(isPrioritizing);
    if (result > 0) {
      debugPrint('----------successfully updated------------');
    } else {
      debugPrint('----------error while updating------------');
    }
    return result;
  }

  updateQuestionAmount(int numOfQuestions) async {
    int result = await settingsRepo.updateQuestionAmount(numOfQuestions);
    if (result > 0) {
      debugPrint('----------successfully updated------------');
    } else {
      debugPrint('----------error while updating------------');
    }
    return result;
  }
}
