import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String onBoardingViewedKey = 'onBoardingViewed';

  Future<bool> setOnBoardingViewed(bool? onBoardingViewed) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(onBoardingViewedKey, onBoardingViewed ?? false);
  }

  Future<bool?> getOnBoardingViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onBoardingViewedKey);
  }

// clear all SharedPreferences data
  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}