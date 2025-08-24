import 'package:project_news/data/model/source_response.dart';
import 'package:project_news/data/repositories/data_sources/local_datasource/new_local_datasource.dart';

class NewsLocalDataSourceImpl2 extends NewsLocalDataSource{ /// دا الداتا الاوفلاين ودا
  /// فايدة حتة الي impl واعمل extend لل abstract class بتاعها هيا ال coupling  يعني لو حصل تغير فا انتا مثلا تغير في كلاس impl مش هايحصل حاجة لل abstract كلاس خالص ودا فايدتوا ان لو حصل تغير في ال project هنغير حاجة مثلا تروح تغيرها في ال impl2 وهيا كدا كدا هتسمع في ال abstract class و ال impl1  لانها فانكشن فاضية بس بتعملها override من عند ال impl 1 and 2 بس فا بتغير هناك

  Future<List<SourceResponse>?>loadSources(String categoryId , String language )async{ /// انا عملت categoryid زي الي فات  عشان ابعتلها الcategory الي موجودة في ال home وبعتلوا اللغة عشان ل غيرت ال api من انجليزي لعربي يجبلي sourceTabbar الحاجات العربي بس وال home نفس الكلام بردو
    //todo: implement flutter sqlflite
    return null ;
  }

  Future<void> saveSources(String category , List<SourceResponse> sources)async {
    //todo: implement flutter sqlflite
  }
}