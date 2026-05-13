import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/features/sets/data/repo/sets_repo.dart';
import 'package:cardy/features/sets/manager/edit_folder_cubit/edit_folder_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFolderCubit extends Cubit<EditFolderState> {
  final SetsRepo setsRepo;
  EditFolderCubit(this.setsRepo) : super(EditFolderInitial());
  updateFolder(FolderModel folder) async {
    emit(EditFolderLoading());
    await setsRepo.updateFolder(folder);
    emit(EditFolderSuccess());
  }
}
