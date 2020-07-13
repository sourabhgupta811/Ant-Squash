import 'dart:math';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:first_game/components/image_provider.dart' as provider;
import 'package:first_game/game_controller.dart';
import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class Enemy{
  Random random;
  int health = 1;
  bool isDead = false;
  bool isPressed = false;
  GameController gameController;
  double enemySize;
  double speed;
  EnemyType enemyType = EnemyType.Chimp;
  Rect enemyPosition;
  SpriteComponent enemyImage;
  SpriteComponent explosionImage;
  int angle;
  Enemy(this.gameController,this.enemyType){
    random = Random();
    if(enemyType==EnemyType.Chimp){
      enemySize = gameController.tileSize*1.5;
      speed = 100;
    }else if(enemyType == EnemyType.Boss){
      enemySize = gameController.tileSize*1.5;
      speed = 200;
    }
    enemyImage = SpriteComponent.fromSprite(enemySize, enemySize, Sprite("ant.png"));
    explosionImage = SpriteComponent.fromSprite(enemySize, enemySize, Sprite("explosion.png"));
    double radius = math.sqrt((gameController.screenSize.width/2*gameController.screenSize.width/2+ gameController.screenSize.height/2*gameController.screenSize.height/2));
    angle = random.nextInt(360);
    double x = gameController.screenSize.width/2 + radius * cos (angle);
    double y = gameController.screenSize.height/2 + radius * sin (angle);
    if(x<0){
      x = x-100;
    }else {
      x = x+100;
    }
    if(y<0){
      y = y-100;
    }else{
      y =y+100;
    }
    enemyPosition = Rect.fromLTWH(x, y, enemySize, enemySize);
  }

  void render(Canvas canvas){
    canvas.save();
    if(!isPressed){
      enemyImage.render(canvas);
    }else{
      explosionImage.render(canvas);
    }
    canvas.restore();
  }

  void update(double time){
    if(!isPressed) {
      double stepDistance = speed * time;
      Offset toPlayer = gameController.player.playerPosition.center -
          enemyPosition.center;
      if (stepDistance <=
          toPlayer.distance - gameController.player.playerSize / 2) {
        Offset stepToPlayer = Offset.fromDirection(
            toPlayer.direction, stepDistance);
        enemyPosition = enemyPosition.shift(stepToPlayer);
        enemyImage.x = enemyPosition.left;
        enemyImage.y = enemyPosition.top;
        explosionImage.x = enemyPosition.left;
        explosionImage.y = enemyPosition.top;
      } else {
        attack();
      }
    }
  }

  void attack(){
    if(!gameController.player.isDead) {
      --gameController.player.currentHealth;
      if(gameController.player.currentHealth<=0){
        gameController.player.isDead = true;
        gameController.score = 0;
        gameController.scoreText.textPainter.text = null;
        gameController.initialize();
      }
      isDead = true;
    }
  }
}

enum EnemyType{
  Boss,
  Chimp
}