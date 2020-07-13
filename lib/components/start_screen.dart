import 'package:first_game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Storage.dart';

class StartScreen {
  GameController gameController;
  TextPainter highScorePainter;
  TextPainter startButton;
  Offset textOffset;
  Offset startButtonOffset;
  int highScore = null;

  StartScreen(this.gameController) {
    highScorePainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    );
    startButton = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    );
    textOffset = Offset.zero;
    startButtonOffset = Offset.zero;
    Storage.getScore().then((value) {
      highScore = value;
      if(value==null)
        highScore = 0;
      update(0);
    });
  }

  void render(Canvas canvas) {
    canvas.save();
    if(highScore!=null) {
      highScorePainter.paint(canvas, textOffset);
      startButton.paint(canvas, startButtonOffset);
      debugPrint("render_start $highScore   ${startButton.text.toString()}");
    }
    canvas.restore();
  }

  void update(double time) {
    if(highScore!=null && highScorePainter.text==null) {
      highScorePainter.text = TextSpan(
          text: "HighScore : ${highScore.toString()}",
          style: TextStyle(
              color: Colors.black,
              fontSize: 40.00
          )
      );
      highScorePainter.layout();
      textOffset = Offset(
          gameController.screenSize.width * 0.5 - highScorePainter.width/2,
          gameController.screenSize.height * 0.1);
      startButton.text = TextSpan(
          text: "Start",
          style: TextStyle(
              color: Colors.black,
              fontSize: 40.00
          )
      );
      startButton.layout();
      startButtonOffset = Offset(
          gameController.screenSize.width * 0.5 - startButton.width/2,
          gameController.screenSize.height * 0.8);
    }
  }
}