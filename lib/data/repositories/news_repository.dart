import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:project_news/data/model/source.dart';
import 'package:project_news/data/repositories/data_sources/new_local_datasource.dart';
import 'package:project_news/data/repositories/data_sources/news_remote_datasource.dart';

class NewsRepository {  /// دا مهمتوا انو يحمل الداتا مش مهمة ال newViewModel فا هنا هانخلي عندوا الداتا الي هيا api ونبعتها لل view new model طب ولية انا عملت كدا عشان اعرف ال الحاجة offline and online يعني  الحاجة الي هاخزنها لو قفلت ال wifi
  NewsRemoteDataSource remoteDataSource; /// بعتلوا الاونلاين
  NewsLocalDataSource localDataSource; /// بعتلوا الاوفلاين
  Connectivity connectivity ;  /// دية من pacalkage called connectivity_plus دية عشان اعرف لما يكون فية wifi او مفيش wifi ويخزن ال sources

  NewsRepository(this.remoteDataSource, this.localDataSource , this.connectivity);

  Future<List<Source>?> loadSources(String categoryId, String language) async { /// انا عملت categoryid زي الي فات  عشان ابعتلها الcategory الي موجودة في ال home وبعتلوا اللغة عشان ل غيرت ال api من انجليزي لعربي يجبلي sourceTabbar الحاجات العربي بس وال home نفس الكلام بردو
    var result = await connectivity.checkConnectivity(); /// دية هنا معناها في نت ولا مفيش نت بيعمل check
    if(result.contains(ConnectivityResult.mobile)||result.contains(ConnectivityResult.wifi)){ /// كدا  انا عملت check هوا فية نت ولا مفيش نت لو فية نت هيخش في اول condition لو مفيش نت هيخش في ال else
     var sources =  await remoteDataSource.loadSources(categoryId, language);
     localDataSource.saveSources( categoryId , sources ?? []); /// بعتها ال sources عشان يعملها save في ال offline
     return sources ;
    }else{
     return localDataSource.loadSources(categoryId, language);
    }
  }
}