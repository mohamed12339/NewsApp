import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String currentLocale = "en" ;

  void  changeLanguage(String language){
    currentLocale = language ;
    notifyListeners() ; /// دية بديل الset state  بس هنا ان الانا كاتبها هتسمع في كل الابليكيشن الي هيا كل الفايلات الانا عاملها انما set state هيا بس بتشتغل في حاجة واحدة انتا عاملها في فايل واحد
  }

}