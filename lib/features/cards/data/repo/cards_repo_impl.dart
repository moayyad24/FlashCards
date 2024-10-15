import 'package:flashcards/core/helper/db_helper.dart';
import 'package:flashcards/core/models/card_model.dart';
import 'package:flashcards/features/cards/data/repo/cards_repo.dart';
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
  Future<int> insertAnewCard(cardModel) async {
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
  Future<int> updateCard(card) async {
    String sql =
        'UPDATE cards SET card_question = ?, card_s_question = ?, card_answer = ?, card_s_answer = ? WHERE card_id = ?';
    List<dynamic> arguments = [
      card.question,
      card.supplementQuestion,
      card.answer,
      card.supplementAnswer,
      card.id,
    ];

    try {
      int result = await update(sql, arguments);
      return result;
    } catch (e) {
      debugPrint('Error updating cards: $e');
      rethrow;
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

  @override
  Future<int> updateSet(setModel) async {
    String sql = 'UPDATE sets SET set_title = ?, set_desc = ? WHERE set_id = ?';
    List<dynamic> arguments = [
      setModel.title,
      setModel.description,
      setModel.setId,
    ];
    try {
      int result = await update(sql, arguments);
      return result;
    } catch (e) {
      debugPrint('Error updating set: $e');
      rethrow;
    }
  }

  @override
  Future<int> updateIsStudiedCard(cardId, isStudied) async {
    String sql = 'UPDATE cards SET card_is_studied = ? WHERE card_id = ?';
    List<dynamic> arguments = [
      isStudied ? 1 : 0,
      cardId,
    ];
    try {
      int result = await update(sql, arguments);
      return result;
    } catch (e) {
      debugPrint('Error updating isStudied: $e');
      rethrow;
    }
  }

  @override
  Future<int> updateForgottenCardNumber(cardId, numberOfForget) async {
    String sql = 'UPDATE cards SET card_forgotten_num = ? WHERE card_id = ?';
    List<dynamic> arguments = [
      numberOfForget,
      cardId,
    ];
    try {
      int result = await update(sql, arguments);
      return result;
    } catch (e) {
      debugPrint('Error updating cards: $e');
      rethrow;
    }
  }

  @override
  Future<List<CardModel>> filterCardsBySettings(setId, settingsModel) async {
    List<CardModel> cardsList = [];

    String baseQuery = 'SELECT * FROM cards WHERE set_id = $setId';
    String limitClause = 'LIMIT ${settingsModel.questionsAmount}';

    String sql = baseQuery;

    if (settingsModel.randomization && settingsModel.prioritizing) {
      sql +=
          ' ORDER BY card_forgotten_num DESC, card_is_studied ASC, RANDOM() $limitClause';
    } else if (settingsModel.randomization) {
      sql += ' ORDER BY card_forgotten_num DESC, RANDOM() $limitClause';
    } else if (settingsModel.prioritizing) {
      sql += ' ORDER BY card_is_studied ASC $limitClause';
    } else {
      sql += ' $limitClause';
    }

    var dataMap = await inquiry(sql);
    cardsList = dataMap.map((e) => CardModel.fromSql(e)).toList();

    return cardsList;
  }
}
