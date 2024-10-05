class CardModel {
  final int? id;
  final String question;
  final String supplementQuestion;
  final String answer;
  final String supplementAnswer;
  bool? isStudied;
  final int? setId;
  final String? createdAt;

  CardModel({
    this.id,
    required this.question,
    required this.supplementQuestion,
    required this.answer,
    required this.supplementAnswer,
    this.isStudied,
    this.setId,
    this.createdAt,
  });
  factory CardModel.fromSql(Map<String, dynamic> sqlMap) {
    return CardModel(
      id: sqlMap['card_id'],
      question: sqlMap['card_question'],
      supplementQuestion: sqlMap['card_s_question'],
      answer: sqlMap['card_answer'],
      supplementAnswer: sqlMap['card_s_answer'],
      isStudied: sqlMap['card_is_studied'] == 1 ? true : false,
      setId: sqlMap['set_id'],
    );
  }
}
