import 'dart:ui';
import 'package:first_game/game_controller.dart';
import 'package:flutter/material.dart';

class HealthBar{
  Rect redBar;
  Rect greenBar;
  GameController gameController;
  HealthBar(this.gameController){
    redBar = Rect.fromLTWH(gameController.screenSize.width*0.1,gameController.screenSize.height*0.9
    , gameController.screenSize.width*0.8,gameController.tileSize*0.4);
    greenBar = Rect.fromLTWH(gameController.screenSize.width*0.1,gameController.screenSize.height*0.9
        , gameController.screenSize.width*0.8,gameController.tileSize*0.4);
  }
  void render(Canvas canvas){
    canvas.save();
    Paint redPaint = Paint()..color = Colors.red;
    Paint greenPaint = Paint()..color = Colors.green;
    canvas.drawRect(redBar, redPaint);
    canvas.drawRect(greenBar, greenPaint);
    canvas.restore();
  }

  void update(double time){
    double width = gameController.screenSize.width*0.8 * (gameController.player.currentHealth/gameController.player.maxHealth);
    greenBar = Rect.fromLTWH(gameController.screenSize.width*0.1,gameController.screenSize.height*0.9
        , width,gameController.tileSize*0.4);
  }
}