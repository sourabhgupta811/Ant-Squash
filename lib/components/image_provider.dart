import 'dart:collection';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart' show rootBundle;

class SpriteProvider{
//  static HashMap<String, Image> hashMap = HashMap<String,Image>();
//
////  static Future<Image> getUiImage(String imageAssetPath, int height, int width) async {
////    final ByteData assetImageByteData = await rootBundle.load(imageAssetPath);
////    Image baseSizeImage = decodeImage(assetImageByteData.buffer.asUint8List());
////    Image resizeImage = copyResize(baseSizeImage, height: height, width: width);
////    Codec codec = await instantiateImageCodec(image.encodePng(resizeImage));
////    FrameInfo frameInfo = await codec.getNextFrame();
////    return frameInfo.image;
////  }
//
//  static Future<Sprite> loadUiImage(String assetPath) async {
//    return Sprite(assetPath);
//  }
//
//  static loadAssets() async{
//    await loadUiImage("assets/ant.png").then((value){
//      hashMap.putIfAbsent("assets/ant.png", () => value);
//    });
//    await loadUiImage("assets/cake.png").then((value){
//      hashMap.putIfAbsent("assets/cake.png", () => value);
//    });
//    await loadUiImage("assets/explosion.png").then((value){
//      hashMap.putIfAbsent("assets/explosion.png", () => value);
//    });
//  }
//
//  static Image getImage(String path){
//    return hashMap[path];
//  }
}