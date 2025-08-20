import 'package:hive_flutter/adapters.dart';
import 'package:project_news/data/model/source.dart';

class NewsLocalDataSource{ /// دا الداتا الاوفلاين
   /// انتا ممكن تستخدم package sqllite ودية مش قوية الاحسن hive وممكن بردو FirebaseFirestore ودية جامدة جدا بردو وانزل packege منها اسمها accessdataoffline

  Future<List<Source>?>loadSources(String categoryId , String language )async{ /// انا عملت categoryid زي الي فات  عشان ابعتلها الcategory الي موجودة في ال home وبعتلوا اللغة عشان ل غيرت ال api من انجليزي لعربي يجبلي sourceTabbar الحاجات العربي بس وال home نفس الكلام بردو
    var box = await Hive.openBox("news"); /// دا هنا بقولوا افتح box وسمية الحاجة الانا عايزها مثلا اسمها كدا
    var sources = box.get(categoryId); /// هاتها بقا ال sources هنا
    return sources ;

  }

  Future<void> saveSources(String category , List<Source> sources)async{
    var box = await Hive.openBox("news"); /// دا هنا بقولوا افتح box وسمية الحاجة الانا عايزها مثلا اسمها كدا
    box.put(category, sources);  /// حط ال sources لا وتروح علي حسب ال category
  }

}