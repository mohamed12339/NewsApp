import 'package:flutter/material.dart';
import 'package:project_news/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';
/// طيب معناة ال extension دية هيا مجرد اني عايز ازود حاجة جواة زي ال buildcontext دا جواة ال dart sdk مينفعش طبعا اخش ازود في ال dart sdk فا ال extension بتخليني ازود بقا الحاجة الانا عايز اكتبها وممكن بردو اكتب هنا حاجات تانية لة غيرت مثلا buildcontext وكتبت اي حاجة تانية مثلا من الحاجات بتاعتك وعايز تزود عليها حاجة زي في كلاس theme provider مش عملنا حاجة اسمها providerSplashMode انتا ممكن تكتبها هنا فا هيا دية ال extension وهيا اكتر استخدامتها انك لو عايز تزود حاجة في كلاس جواة  ال dart sdk او حاجة عندك انتا وهيا مهمة اوي
extension BuildContextExtensions on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary; ///  هنا معنا this ان بعرفوا ال context بدل ما اكتبها لاني انا اصلا جواة ال buildContext

  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  TextTheme get textTheme => Theme.of(this).textTheme ;

  ThemeData get themeData => Theme.of(this);

  ThemeProvider get themeProvider => Provider.of(this); /// انا عملت دية كمان عشان بردو مقعدش اعمل زي الي عاملوا في ال فايل ال splash وزي evently وكدا

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  /// الحاجات اقدر استخدمها ازاي هتقولوا context.وتكمل ببقا
}