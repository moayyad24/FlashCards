import 'package:flashcards/core/helper/collection_type.dart';

class CollectionModel {
  final String title;
  final String description;
  final int? folderId;
  final String? createdAt;
  final CollectionType? type;

  CollectionModel({
    required this.title,
    required this.description,
    this.folderId,
    this.createdAt,
    this.type,
  });

  factory CollectionModel.fromSql(Map<String, dynamic> map) {
    return CollectionModel(
      title: map['title'],
      description: map['description'],
      folderId: map['id'],
      createdAt: map['created_at'],
      type: map['id'] == 0 ? CollectionType.sets : CollectionType.folder,
    );
  }
}
