import 'package:flutter/material.dart';
import 'package:project_news/ui/utilts/app_assets.dart';

class ThemeProvider extends ChangeNotifier{
  var themeMode = ThemeMode.dark ;

  String get providerSplashMode =>  themeMode == ThemeMode.light  /// دية كاتبها هنا عشان هستخدمها كتير في لما اغير من dark or light زي الانا عملتوا evently بس بكتبها جواة كل واحدة كدا احسن بس دية تغير صورة بس بتاعتة ال splash ممكن ابقا اكتب الباقي هنا
      ? AppAssets.splashLight
      : AppAssets.splashDark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void changeTheme(ThemeMode newMode){
   themeMode = newMode ;

    notifyListeners(); /// دية زيها زي ال setstate بس دية مع ال provider بس

  }
}