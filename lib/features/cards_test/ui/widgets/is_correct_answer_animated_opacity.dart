import 'package:flutter/material.dart';

class IsCorrectAnswerAnimatedOpacity extends StatelessWidget {
  const IsCorrectAnswerAnimatedOpacity({
    super.key,
    required this.isCorrectAnswer,
  });

  final int isCorrectAnswer;

  //check if its a correct answer or you should study again
  bool? get checkCorrectAnswer {
    if (isCorrectAnswer == 1) {
      return true;
    } else if (isCorrectAnswer == 2) {
      return false;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: checkCorrectAnswer != null ? 1.0 : 0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
        height: 25,
        decoration: BoxDecoration(
          color: (checkCorrectAnswer != null && checkCorrectAnswer == true)
              ? Colors.green
              : Colors.red,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Text(
          (checkCorrectAnswer != null && checkCorrectAnswer == true)
              ? 'Got it'
              : 'Study again',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
