import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/models/set_model.dart';

class HomeModel {
  final List<FolderModel> folders;
  final List<SetModel> sets;

  HomeModel({required this.folders, required this.sets});
}
