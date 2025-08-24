import 'package:project_news/domain/model/source.dart';

abstract class NewsRepository {  /// دا مهمتوا انو يحمل الداتا مش مهمة ال newViewModel فا هنا هانخلي عندوا الداتا الي هيا api ونبعتها لل view new model طب ولية انا عملت كدا عشان اعرف ال الحاجة offline and online يعني  الحاجة الي هاخزنها لو قفلت ال wifi

  Future<List<Source>?> loadSources(String categoryId, String language);   /// انا عملت categoryid زي الي فات  عشان ابعتلها الcategory الي موجودة في ال home وبعتلوا اللغة عشان ل غيرت ال api من انجليزي لعربي يجبلي sourceTabbar الحاجات العربي بس وال home نفس الكلام بردو
}