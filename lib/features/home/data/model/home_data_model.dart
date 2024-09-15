import 'package:flashcards/core/helper/collection_type.dart';

class HomeDataModel {
  final String title;
  final String description;
  final int? folderId;
  final String? createdAt;
  final CollectionType? type;

  HomeDataModel({
    required this.title,
    required this.description,
    this.folderId,
    this.createdAt,
    this.type,
  });

  factory HomeDataModel.fromSql(Map<String, dynamic> map) {
    return HomeDataModel(
      title: map['title'],
      description: map['description'],
      folderId: map['id'],
      createdAt: map['created_at'],
      type: map['id'] == 0 ? CollectionType.sets : CollectionType.folder,
    );
  }
}
