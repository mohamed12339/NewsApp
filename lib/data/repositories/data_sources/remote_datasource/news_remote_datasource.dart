import 'package:project_news/data/model/source_response.dart';

 abstract class NewsRemoteDataSource{ /// دا الداتا الاونلاين دا هوا ال abstract الي مش هابعت فية الحاجة ال impl هوا الي هايبعت الحاجة
  Future<List<SourceResponse>?>loadSources(String categoryId , String language );  /// انا عملت categoryid زي الي فات  عشان ابعتلها الcategory الي موجودة في ال home وبعتلوا اللغة عشان ل غيرت ال api من انجليزي لعربي يجبلي sourceTabbar الحاجات العربي بس وال home نفس الكلام بردو
}