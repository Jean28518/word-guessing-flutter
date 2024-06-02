import 'dart:convert';
import 'dart:io';

import 'package:app/controller/word_guess_controller.dart';
import 'package:app/pages/word_guess.dart';
import 'package:flutter/material.dart';

class GameManagerPage extends StatelessWidget {
  const GameManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("Select a language"),
        Expanded(
          child: ListView(
            children: [
              for (String language in getAllLanguages())
                ListTile(
                  title: Text(language),
                  onTap: () {
                    // Add your onTap code here!
                    print("You selected $language!");
                    Map<String, dynamic> jsonObject = readJsonFile(language);
                    WordGuessController wordGuessController =
                        WordGuessController(
                      wordList: jsonObject["list"].cast<Map<String, dynamic>>(),
                      keyboard: jsonObject["keyboard"], //.cast<List<String>>(),
                    );
                    wordGuessController.loadNewWord();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WordGuessPage(
                          controller: wordGuessController,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ],
    ));
  }

  getAllLanguages() {
    // Get all files in wordlist directory
    String path = "wordlist";
    // Print current directory
    print(Directory.current.path);
    Directory dir = Directory(path);
    List<FileSystemEntity> files = dir.listSync();
    List<String> languages = [];
    for (FileSystemEntity file in files) {
      languages.add(
          file.path.split("/").last.split(".").first.replaceAll(".json", ""));
    }
    return languages;
  }

  Map<String, dynamic> readJsonFile(String language) {
    // Read a JSON file
    String path = "wordlist/$language.json";
    File file = File(path);
    String content = file.readAsStringSync();
    return jsonDecode(content);
  }
}
