class FolderModel {
  final int id;
  final String title;
  final String description;
  final int numOfSets;
  final int numOfCards;
  final String? createdAt;

  FolderModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.numOfSets,
      required this.numOfCards,
      this.createdAt});

  factory FolderModel.fromSql(Map<String, dynamic> map) {
    return FolderModel(
        id: map['folder_id'],
        title: map['folder_title'],
        description: map['folder_desc'],
        numOfSets: map['num_of_sets'],
        numOfCards: map['num_of_cards'],
        createdAt: map['created_at']);
  }
}
