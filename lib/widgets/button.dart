import 'package:app/controller/word_guess_controller.dart';
import 'package:app/enum/LetterStatus.dart';
import 'package:flutter/material.dart';

class GuessButton extends StatefulWidget {
  String letter;
  WordGuessController wordGuessController;
  GuessButton({required this.letter, required this.wordGuessController});

  @override
  State<GuessButton> createState() => _GuessButtonState();
}

class _GuessButtonState extends State<GuessButton> {
  LetterStatus status = LetterStatus.notAnswered;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your onPressed code here!
        // print("You pressed $letter!");
        bool right = widget.wordGuessController.isLetterInWord(widget.letter);
        print("Is ${widget.letter} in the word? $right");
        if (right) {
          setState(() {
            status = LetterStatus.correct;
          });
        } else {
          setState(() {
            status = LetterStatus.incorrect;
          });
        }
      },
      child: Text(widget.letter),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(status == LetterStatus.notAnswered
                ? Colors.white
                : status == LetterStatus.correct
                    ? Colors.green
                    : Colors.red),
      ),
    );
  }
}
