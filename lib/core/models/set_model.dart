class SetModel {
  final int id;
  final String title;
  final String description;
  final int folderId;
  final int numOfCards;
  final String? createdAt;

  SetModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.folderId,
      required this.numOfCards,
      required this.createdAt});

  factory SetModel.fromSql(Map<String, dynamic> map) {
    return SetModel(
        id: map['set_id'],
        title: map['set_title'],
        description: map['set_desc'],
        folderId: map['folder_id'],
        numOfCards: map['num_of_cards'],
        createdAt: map['created_at']);
  }
}
