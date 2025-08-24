import 'package:project_news/data/api_manager.dart';
import 'package:project_news/data/model/source_response.dart';
import 'package:project_news/data/repositories/data_sources/remote_datasource/news_remote_datasource.dart';

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource{ /// دا الداتا الاونلاين
  ApiManager apiManager ; ///انا بعتللك ال api اهو وعملتلو كونستراكتور

  NewsRemoteDataSourceImpl(this.apiManager);

  Future<List<SourceResponse>?>loadSources(String categoryId , String language ){  /// انا عملت categoryid زي الي فات  عشان ابعتلها الcategory الي موجودة في ال home وبعتلوا اللغة عشان ل غيرت ال api من انجليزي لعربي يجبلي sourceTabbar الحاجات العربي بس وال home نفس الكلام بردو

    return apiManager.loadSources(language, categoryId);
  }
}