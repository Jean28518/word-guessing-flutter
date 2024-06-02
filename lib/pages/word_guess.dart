import 'package:app/controller/word_guess_controller.dart';
import 'package:app/widgets/keyboard.dart';
import 'package:app/pages/game_manager.dart';
import 'package:app/widgets/word_display.dart';
import 'package:flutter/material.dart';

class WordGuessPage extends StatelessWidget {
  WordGuessController controller;
  WordGuessPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Guess the word!"),
            Text("Hint: ${controller.word["hint"]}"),
            ListenableBuilder(
                listenable: controller,
                builder: (context, Widget? child) =>
                    WordDisplay(controller: controller)),
            KeyboardWidget(wordGuessController: controller),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GameManagerPage(),
                      ),
                    );
                  },
                  child: Text("Back"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.loadNewWord();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WordGuessPage(
                          controller: controller,
                        ),
                      ),
                    );
                  },
                  child: Text("Skip"),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: ListenableBuilder(
          listenable: controller,
          builder: (context, Widget? child) {
            if (controller.guessed) {
              return FloatingActionButton(
                onPressed: () {
                  controller.loadNewWord();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WordGuessPage(
                        controller: controller,
                      ),
                    ),
                  );
                },
                child: Icon(Icons.check),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
