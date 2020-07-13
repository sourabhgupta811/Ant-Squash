import 'package:shared_preferences/shared_preferences.dart';

class Storage{
  static void saveScore(int score) async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    int score1 = await getScore();
    if(score1 == null || score1<score) {
      sharedPref.setInt("score", score);
    }
  }
  static Future<int> getScore() async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getInt("score");
  }
}