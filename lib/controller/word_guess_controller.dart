import 'dart:math';

import 'package:app/data/ignored_signs.dart';
import 'package:flutter/material.dart';

class WordGuessController extends ChangeNotifier {
  WordGuessController(
      {this.guessedLetters = const [],
      this.wordList = const [],
      this.keyboard = const []}) {
    guessedLetters = [];
  }

  Map<String, dynamic> word = {};
  List<String> guessedLetters = [];
  bool guessed = false;
  // late List<List<String>> keyboard;
  late List<dynamic> keyboard;

  List<Map<String, dynamic>> wordList = [];

  bool isLetterInWord(String letter) {
    bool result = word["word"].toLowerCase().contains(letter.toLowerCase());
    if (result) {
      if (!guessedLetters.contains(letter.toLowerCase())) {
        guessedLetters.add(letter.toLowerCase());
      }
      // Remove multiple occurrences of the same letter
      List<String> requiredLetters = [];
      for (int i = 0; i < word["word"].length; i++) {
        if (!requiredLetters.contains(word["word"][i].toLowerCase())) {
          if (ignoredSigns.contains(word["word"][i]) == false &&
              word["word"][i] != " ") {
            requiredLetters.add(word["word"][i].toLowerCase());
          }
        }
      }
      //
      print(requiredLetters);
      if (requiredLetters.length == guessedLetters.length) {
        guessed = true;
        print("You guessed the word!");
      }
      notifyListeners();
    }
    return result;
  }

  void loadNewWord() {
    word = wordList.elementAt(Random().nextInt(wordList.length));
    guessed = false;
    guessedLetters = [];
    notifyListeners();
  }
}
