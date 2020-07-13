
import 'package:first_game/components/image_provider.dart' as provider;
import 'package:first_game/game_controller.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Player{
  double playerSize;
  GameController gameController;
  int currentHealth = 3;
  int maxHealth = 3;
  bool isDead = false;
  Rect playerPosition;
  SpriteComponent playerImage;
  Player(this.gameController){
    playerSize = gameController.tileSize*1.5;
    playerPosition = Rect.fromLTWH(
        gameController.screenSize.width/2-playerSize/2,
        gameController.screenSize.height/2-playerSize/2,
        playerSize, playerSize);
    playerImage = SpriteComponent.fromSprite(playerSize, playerSize, Sprite("cake.png"));
    playerImage.x = playerPosition.left;
    playerImage.y = playerPosition.top;
  }
  void render(Canvas canvas){
    Paint paint = Paint()..color = Colors.white;
    canvas.save();
    playerImage.render(canvas);
    canvas.restore();
//    canvas.drawImage(playerImage, Offset(playerPosition.left, playerPosition.top), paint);
//    canvas.drawRect(playerPosition,paint);
  }

  void update(double time){

  }
}