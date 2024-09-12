class SetModel {
  final String title;
  final String description;

  SetModel({required this.title, required this.description});

  factory SetModel.fromSql(Map<String, dynamic> map) {
    return SetModel(title: map['set_title'], description: map['set_desc']);
  }
}
