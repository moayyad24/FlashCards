class SettingsModel {
  final bool randomization;
  final bool prioritizing;
  final int questionsAmount;

  SettingsModel(
      {required this.randomization,
      required this.prioritizing,
      required this.questionsAmount});

  factory SettingsModel.fromSql(Map<String, dynamic> map) {
    return SettingsModel(
      randomization: map['randomization'] == 1 ? true : false,
      prioritizing: map['prioritizing'] == 1 ? true : false,
      questionsAmount: map['question_amount'],
    );
  }
}
