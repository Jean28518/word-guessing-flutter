import 'package:app/controller/word_guess_controller.dart';
import 'package:app/widgets/button.dart';
import 'package:flutter/material.dart';

class KeyboardWidget extends StatelessWidget {
  WordGuessController wordGuessController;
  KeyboardWidget({super.key, required this.wordGuessController});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < wordGuessController.keyboard.length; i++) {
      // print(wordGuessController.keyboard);
      List<String> row = wordGuessController.keyboard[i].cast<String>();
      List<Widget> rowChildren = [];
      for (int j = 0; j < row.length; j++) {
        rowChildren.add(GuessButton(
          letter: row[j],
          wordGuessController: wordGuessController,
        ));
      }
      children.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      ));
    }
    return Column(
      children: children,
    );
    // return Column(
    //   children: [
    //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //       GuessButton(letter: "A", wordGuessController: wordGuessController),
    //       GuessButton(letter: "Z", wordGuessController: wordGuessController),
    //       GuessButton(letter: "E", wordGuessController: wordGuessController),
    //       GuessButton(letter: "R", wordGuessController: wordGuessController),
    //       GuessButton(letter: "T", wordGuessController: wordGuessController),
    //       GuessButton(letter: "Y", wordGuessController: wordGuessController),
    //       GuessButton(letter: "U", wordGuessController: wordGuessController),
    //       GuessButton(letter: "I", wordGuessController: wordGuessController),
    //       GuessButton(letter: "O", wordGuessController: wordGuessController),
    //       GuessButton(letter: "P", wordGuessController: wordGuessController),
    //     ]),
    //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //       GuessButton(letter: "Q", wordGuessController: wordGuessController),
    //       GuessButton(letter: "S", wordGuessController: wordGuessController),
    //       GuessButton(letter: "D", wordGuessController: wordGuessController),
    //       GuessButton(letter: "F", wordGuessController: wordGuessController),
    //       GuessButton(letter: "G", wordGuessController: wordGuessController),
    //       GuessButton(letter: "H", wordGuessController: wordGuessController),
    //       GuessButton(letter: "J", wordGuessController: wordGuessController),
    //       GuessButton(letter: "K", wordGuessController: wordGuessController),
    //       GuessButton(letter: "L", wordGuessController: wordGuessController),
    //       GuessButton(letter: "M", wordGuessController: wordGuessController),
    //     ]),
    //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //       GuessButton(letter: "W", wordGuessController: wordGuessController),
    //       GuessButton(letter: "X", wordGuessController: wordGuessController),
    //       GuessButton(letter: "C", wordGuessController: wordGuessController),
    //       GuessButton(letter: "V", wordGuessController: wordGuessController),
    //       GuessButton(letter: "B", wordGuessController: wordGuessController),
    //       GuessButton(letter: "N", wordGuessController: wordGuessController),
    //     ]),
    //   ],
    // );
  }
}
