import 'package:project_news/data/model/source_response.dart';

 abstract class NewsLocalDataSource{   /// دا الداتا الاوفلاين وكمان دا هوا ال abstract الي مش هابعت فية الحاجة ال impl هوا الي هايبعت الحاجة


  Future<List<SourceResponse>?>loadSources(String categoryId , String language );

  Future<void> saveSources(String category , List<SourceResponse> sources);

 }
