import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:project_news/data/mappers/source_mapper.dart';
import 'package:project_news/data/repositories/data_sources/local_datasource/new_local_datasource.dart';
import 'package:project_news/data/repositories/data_sources/remote_datasource/news_remote_datasource.dart';
import 'package:project_news/domain/model/source.dart';
import 'package:project_news/domain/repositories/news_repository_domain.dart';

class NewsRepositoryImpl extends NewsRepository {  /// دا مهمتوا انو يحمل الداتا مش مهمة ال newViewModel فا هنا هانخلي عندوا الداتا الي هيا api ونبعتها لل view new model طب ولية انا عملت كدا عشان اعرف ال الحاجة offline and online يعني  الحاجة الي هاخزنها لو قفلت ال wifi
  NewsRemoteDataSource remoteDataSource; /// بعتلوا الاونلاين
  NewsLocalDataSource localDataSource; /// بعتلوا الاوفلاين
  Connectivity connectivity ;  /// دية من pacalkage called connectivity_plus دية عشان اعرف لما يكون فية wifi او مفيش wifi ويخزن ال sources
  SourceMapper sourceMapper ; /// عرفت ال sourceMapper عشان استخدم الحاجة الي الانا عايزها من الكلاس الكبير الي موجود في ال data واقدر استخدم هنا source بتاع ال domain بس
  NewsRepositoryImpl({required this.remoteDataSource, required this.localDataSource ,required this.connectivity ,required this.sourceMapper} );

  Future<List<Source>?> loadSources(String categoryId, String language) async { /// انا عملت categoryid زي الي فات  عشان ابعتلها الcategory الي موجودة في ال home وبعتلوا اللغة عشان ل غيرت ال api من انجليزي لعربي يجبلي sourceTabbar الحاجات العربي بس وال home نفس الكلام بردو
    var result = await connectivity.checkConnectivity(); /// دية هنا معناها في نت ولا مفيش نت بيعمل check
    if(result.contains(ConnectivityResult.mobile)||result.contains(ConnectivityResult.wifi)){ /// كدا  انا عملت check هوا فية نت ولا مفيش نت لو فية نت هيخش في اول condition لو مفيش نت هيخش في ال else
     var sources =  await remoteDataSource.loadSources(categoryId, language);
     localDataSource.saveSources( categoryId , sources ?? []); /// بعتها ال sources عشان يعملها save في ال offline
     return sourceMapper.fromDataModels( sources ?? []) ; ///انا كدا بعتلوا الحاجة بس الي هاستخدمها من عن طريق ال sourceMapper ودا الي domain layer  وبقولوا هنا خد الليستة لو ب null حط ليستة فاضية
    }else{
      var sources =  await remoteDataSource.loadSources(categoryId, language);
     return sourceMapper.fromDataModels(sources??[]);  /// هنا بردوا بقولوا حولي الليستة الي جاية من ال backend فا ال sourceMapper يحولها
    }
  }
}