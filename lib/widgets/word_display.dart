import 'package:app/controller/word_guess_controller.dart';
import 'package:app/data/ignored_signs.dart';
import 'package:flutter/material.dart';

class WordDisplay extends StatelessWidget {
  const WordDisplay({
    super.key,
    required this.controller,
  });

  final WordGuessController controller;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    print(controller.word["word"]);
    for (int i = 0; i < controller.word["word"].length; i++) {
      String letter = controller.word["word"][i];
      if (letter == " ") {
        children.add(SizedBox(width: 15));
      } else if (ignoredSigns.contains(letter)) {
        children.add(
          SizedBox(
            width: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(letter),
              ],
            ),
          ),
        );
      } else {
        children.add(
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.grey),
            // child: Text("_ ")),
            child: Text(controller.guessedLetters
                    .contains(controller.word["word"][i].toLowerCase())
                ? controller.word["word"][i].toUpperCase()
                : "_"),
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
