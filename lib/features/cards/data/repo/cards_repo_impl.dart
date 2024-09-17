import 'package:flashcards/core/helper/db_helper.dart';
import 'package:flashcards/features/cards/data/models/card_model.dart';
import 'package:flashcards/features/cards/data/repo/cards_repo.dart';

class CardsRepoImpl extends CardsRepo with DbHelper {
  @override
  Future<List<CardModel>> fetchCards(setId) async {
    List<CardModel> cardsList = [];
    String sql = 'SELECT * FROM card WHERE set_id = $setId';
    var dataMap = await inquiry(sql);
    for (var e in dataMap) {
      cardsList.add(CardModel.fromSql(e));
    }
    return cardsList;
  }

  @override
  Future<int> insertAnewCard(CardModel cardModel) async {
    String sql = '''
    INSERT INTO card (card_question, card_s_question, card_answer, card_s_answer, set_id) 
    VALUES (?, ?, ?, ?, ?);
  ''';

    List<dynamic> arguments = [
      cardModel.question,
      cardModel.supplementQuestion,
      cardModel.answer,
      cardModel.supplementAnswer,
      cardModel.setId,
    ];

    int result = await insert(sql, arguments);
    return result;
  }
}
