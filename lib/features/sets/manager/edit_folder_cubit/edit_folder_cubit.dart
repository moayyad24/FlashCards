import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/features/sets/data/repo/sets_repo.dart';
import 'package:flashcards/features/sets/manager/edit_folder_cubit/edit_folder_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFolderCubit extends Cubit<EditFolderState> {
  final SetsRepo setsRepo;
  EditFolderCubit(this.setsRepo) : super(EditFolderInitial());
  updateFolder(CollectionModel folder) async {
    emit(EditFolderLoading());
    await setsRepo.updateFolder(folder);
    emit(EditFolderSuccess());
  }
}
