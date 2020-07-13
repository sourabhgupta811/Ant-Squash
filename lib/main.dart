import 'package:first_game/components/image_provider.dart' as provider;
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'game_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
//  await provider.ImageProvider.loadAssets();
  GameController gameController = GameController();
  runApp(gameController.widget);
  TapGestureRecognizer gestureRecognizer = TapGestureRecognizer();
  gestureRecognizer.onTapDown = gameController.onTapDown;
  flameUtil.addGestureRecognizer(gestureRecognizer);
}
