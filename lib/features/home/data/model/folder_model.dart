class FolderModel {
  final String title;
  final String description;
  final String createdAt;

  FolderModel({
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory FolderModel.fromSql(Map<String, dynamic> map) {
    return FolderModel(
        title: map['folder_title'],
        description: map['folder_desc'],
        createdAt: map['created_at']);
  }
}
