class SetModel {
  final String title;
  final String description;
  final int? folderId;
  final String? createdAt;

  SetModel({
    required this.title,
    required this.description,
    this.folderId,
    this.createdAt,
  });

  factory SetModel.fromSql(Map<String, dynamic> map) {
    return SetModel(
        title: map['set_title'],
        description: map['set_desc'],
        folderId: map['folder_id'],
        createdAt: map['created_at']);
  }
}
