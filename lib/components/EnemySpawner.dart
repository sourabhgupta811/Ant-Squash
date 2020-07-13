import 'dart:ui';

import 'package:first_game/components/Enemy.dart';
import 'package:first_game/game_controller.dart';

class EnemySpawner{
  int minSpawnDifference = 300;
  int maxSpawnDifference  = 1500;
  int nextSpawnTime = 0;
  int currentInterval;
  int intervalChange = 3;
  int maxEnemies = 100;
  List<Enemy> enemyList;
  GameController gameController;
  EnemySpawner(this.enemyList,this.gameController){
    initialize();
    killAllEnemies();
  }
  void initialize(){
    currentInterval = maxSpawnDifference;
    nextSpawnTime = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }
  void update(double time){
    int now = DateTime.now().millisecondsSinceEpoch;
    if(now>nextSpawnTime && enemyList.length<maxEnemies){
      enemyList.add(Enemy(gameController, EnemyType.Chimp));
      nextSpawnTime = (now + currentInterval).toInt();
      currentInterval = (currentInterval*0.1).toInt();
      if(currentInterval<minSpawnDifference){
        currentInterval = minSpawnDifference;
      }
      enemyList.forEach((element) {
        if(element.isPressed) element.isDead = true;
      });
    }
  }

  void render(Canvas canvas){

  }

  void killAllEnemies(){
    enemyList.forEach((element) {
      element.isDead = true;
    });
  }
}