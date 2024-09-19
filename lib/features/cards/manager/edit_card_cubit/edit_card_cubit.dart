import 'package:flashcards/features/cards/data/models/card_model.dart';
import 'package:flashcards/features/cards/data/repo/cards_repo.dart';
import 'package:flashcards/features/cards/manager/edit_card_cubit/edit_card_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCardCubit extends Cubit<EditCardState> {
  CardsRepo cardsRepo;
  EditCardCubit(this.cardsRepo) : super(EditCardInitial());

  late GlobalKey<FormState> formKey;
  late TextEditingController questionController;
  late TextEditingController supplementQuestionController;
  late TextEditingController answerController;
  late TextEditingController supplementAnswerController;
  initializeController(CardModel card) {
    formKey = GlobalKey<FormState>();
    questionController = TextEditingController();
    supplementQuestionController = TextEditingController();
    answerController = TextEditingController();
    supplementAnswerController = TextEditingController();
    questionController.text = card.question;
    supplementQuestionController.text = card.supplementQuestion;
    answerController.text = card.answer;
    supplementAnswerController.text = card.supplementAnswer;
  }

  updateCard(CardModel card) async {
    emit(EditCardLoading());
    await cardsRepo.updateCard(card);
    emit(EditCardSuccess());
  }
}
