import 'dart:ui';

import 'package:first_game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Storage.dart';

class ScoreText{
  GameController gameController;
  TextPainter textPainter;
  Offset textOffset;

  ScoreText(this.gameController){
    textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    );
    textOffset = Offset.zero;
  }

  void render(Canvas canvas){
    canvas.save();
    textPainter.paint(canvas, textOffset);
    canvas.restore();
  }

  void update(double time) {
    if((textPainter.text?? "")!=gameController.score.toString()){
      textPainter.text = TextSpan(
        text:gameController.score.toString(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 50.00
        )
      );
      textPainter.layout();
      textOffset = Offset(gameController.screenSize.width*0.03, gameController.screenSize.height*0.03);
    }
  }
}