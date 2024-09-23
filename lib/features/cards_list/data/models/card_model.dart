class CardModel {
  final int? id;
  final String question;
  final String supplementQuestion;
  final String answer;
  final String supplementAnswer;
  final int? setId;
  final String? createdAt;

  CardModel({
    this.id,
    required this.question,
    required this.supplementQuestion,
    required this.answer,
    required this.supplementAnswer,
    this.setId,
    this.createdAt,
  });
  factory CardModel.fromSql(Map<String, dynamic> sqlMap) {
    return CardModel(
      id: sqlMap['card_id'],
      question: sqlMap['card_question'],
      supplementQuestion: sqlMap['card_s_question'],
      answer: sqlMap['card_answer'],
      setId: sqlMap['set_id'],
      supplementAnswer: sqlMap['card_s_answer'],
    );
  }
}
