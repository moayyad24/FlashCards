class HomeDataModel {
  final String title;
  final String description;
  final int folderId;
  final String createdAt;

  HomeDataModel(
      {required this.title,
      required this.description,
      required this.folderId,
      required this.createdAt});

  factory HomeDataModel.fromSql(Map<String, dynamic> map) {
    return HomeDataModel(
      title: map['title'],
      description: map['description'],
      folderId: map['id'],
      createdAt: map['created_at'],
    );
  }
}
