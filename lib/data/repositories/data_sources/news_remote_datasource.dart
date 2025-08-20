import 'package:project_news/data/api_manager.dart';
import 'package:project_news/data/model/source.dart';

class NewsRemoteDataSource{ /// دا الداتا الاونلاين
  ApiManager apiManager ; ///انا بعتللك ال api اهو وعملتلو كونستراكتور

  NewsRemoteDataSource(this.apiManager);

  Future<List<Source>?>loadSources(String categoryId , String language ){  /// انا عملت categoryid زي الي فات  عشان ابعتلها الcategory الي موجودة في ال home وبعتلوا اللغة عشان ل غيرت ال api من انجليزي لعربي يجبلي sourceTabbar الحاجات العربي بس وال home نفس الكلام بردو

    return apiManager.loadSources(language, categoryId);
  }
}