import 'package:flashcards/core/helper/db_helper.dart';
import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards_list/data/repo/cards_repo.dart';
import 'package:flutter/foundation.dart';

class CardsRepoImpl extends DbHelper implements CardsRepo {
  @override
  Future<List<CardModel>> fetchCards(setId) async {
    List<CardModel> cardsList = [];
    String sql = 'SELECT * FROM cards WHERE set_id = $setId';
    var dataMap = await inquiry(sql);
    for (var e in dataMap) {
      cardsList.add(CardModel.fromSql(e));
    }
    return cardsList;
  }

  @override
  Future<int> insertAnewCard(CardModel cardModel) async {
    String sql = '''
    INSERT INTO cards (card_question, card_s_question, card_answer, card_s_answer, set_id) 
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

  @override
  Future<int> updateCard(cards) async {
    String sql =
        'UPDATE cards SET card_question = ?, card_s_question = ?, card_answer = ?, card_s_answer = ? WHERE card_id = ?';
    List<dynamic> arguments = [
      cards.question,
      cards.supplementQuestion,
      cards.answer,
      cards.supplementAnswer,
      cards.id,
    ];

    try {
      int result = await update(sql, arguments);
      return result;
    } catch (e) {
      // Handle the error (log it, rethrow, etc.)
      debugPrint('Error updating cards: $e');
      rethrow; // Rethrow the exception if you don't want to handle it here
    }
  }

  @override
  Future<int> deleteCards(cardsIds) async {
    // Create a list of placeholders for the query
    String placeholders = List.filled(cardsIds.length, '?').join(', ');
    // Construct the SQL DELETE statement
    String sql = 'DELETE FROM cards WHERE card_id IN ($placeholders)';

    // Execute the delete command
    int result = await delete(sql, cardsIds);
    return result;
  }
}
