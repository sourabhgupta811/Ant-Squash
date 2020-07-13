import 'dart:ui';
import 'package:first_game/Storage.dart';
import 'package:first_game/components/ScoreText.dart';
import 'package:first_game/components/State.dart';
import 'package:first_game/components/health_bar.dart';
import 'package:first_game/components/start_screen.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'components/Enemy.dart';
import 'components/EnemySpawner.dart';
import 'components/Player.dart';

class GameController extends Game{
  Size screenSize;
  double tileSize;
  Player player;
  List<Enemy> enemy;
  HealthBar healthBar;
  EnemySpawner enemySpawner;
  int score = 0;
  ScoreText scoreText;
  StartScreen startScreen;
  GameState gameState;
  GameController(){
    initialize();
  }

  void initialize () async{
    resize(await Flame.util.initialDimensions());
    player = Player(this);
    enemy = List<Enemy>();
    enemySpawner = new EnemySpawner(enemy,this);
    healthBar = HealthBar(this);
    scoreText = ScoreText(this);
    startScreen = StartScreen(this);
    gameState = GameState.Start;
  }

  @override
  void render(Canvas canvas) {
    Paint backGroundPaint = Paint()
      ..color = Color.fromARGB(255, 250, 250, 250);
    Rect backgroundRect = Rect.fromLTWH(
        0, 0, screenSize.width, screenSize.height);
    canvas.drawRect(backgroundRect, backGroundPaint);
    player.render(canvas);
    if(gameState ==GameState.Playing) {
      enemy.forEach((enemyPlayer) {
        if (!enemyPlayer.isDead) {
          enemyPlayer.render(canvas);
        }
      });
      healthBar.render(canvas);
      scoreText.render(canvas);
    }else if(gameState == GameState.Start){
      startScreen.render(canvas);
    }
  }

  @override
  void update(double time) {
    if(gameState==GameState.Playing) {
      enemy.forEach((enemyPlayer) {
        if (!enemyPlayer.isDead) {
          enemyPlayer.update(time);
        }
      });
      enemy.removeWhere((enemyPlayer) {
        return enemyPlayer.isDead;
      });
      if (!player.isDead) {
        enemySpawner.update(time);
      } else {
        enemySpawner.killAllEnemies();
      }
      healthBar.update(time);
      scoreText.update(time);
    }else if(gameState==GameState.Start){
      startScreen.update(time);
    }
  }

  void resize(Size size){
    screenSize = size;
    tileSize = screenSize.width/10;
  }

  void onTapDown(TapDownDetails tapDownDetails){
    if(gameState==GameState.Playing) {
      enemy.forEach((enemyPlayer) {
        if (!enemyPlayer.isDead) {
          if (enemyPlayer.enemyPosition.contains(
              tapDownDetails.globalPosition)) {
            --enemyPlayer.health;
            ++score;
            Storage.saveScore(score);
            if (enemyPlayer.health <= 0) {
              enemyPlayer.isPressed = true;
            }
          }
        }
      });
    }else if(gameState==GameState.Start){
        gameState = GameState.Playing;
    }
  }

}