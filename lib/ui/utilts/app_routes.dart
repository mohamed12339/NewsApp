import 'package:flutter/material.dart';
import 'package:project_news/ui/model/category.dm.dart';
import 'package:project_news/ui/screens/home/home.dart';
import 'package:project_news/ui/screens/news/news.dart';
import 'package:project_news/ui/screens/splash/splash.dart';

abstract final class AppRoutes{ /// طب ال get دية هيا مش هاتخليك تاخد كلمة زي ال splash او home مش هتاخد parameter() وانتا بتنادي عليها والحاجة دية مشروحة في ال كشكول اكتر مع ال set كمان

 static Route get splash => MaterialPageRoute(builder: (_) => Splash()); /// MaterialPageRoute :  routes وبتعمل  main dart هيا هيا الي كنت بتعملها في

 static Route get home => MaterialPageRoute(builder: (_) => Home());

 static Route  news(CategoryDM category) => MaterialPageRoute(builder: (_) => News(categoryDM: category,)); /// دية خلتها ب () عشان اعرف ابعتلها ان لما المستخم يدوس علي الموجدين في ال home يروح عليها بس

 /// حاجة مهمة متنساش static عشان تعرف تستخدم ال app routes
}