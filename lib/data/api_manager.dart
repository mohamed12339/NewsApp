import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_news/data/model/article.dart';
import 'package:project_news/data/model/articles_response.dart';
import 'package:project_news/data/model/source.dart';
import 'package:project_news/data/model/sources_response.dart';
///شرح  API  في كشكولي
class ApiManager{
 late Dio dio ;   /// اول حاجة لازم يبقا عندك object من dio او لو حملت package http لازم تكتب كدا وانا كتبتها هنا عشان بدل ما اكريتوا في واحد لا دا كدا كدا مشترك نفس الكلام في سطر 11
 // ApiManager(){
 //  dio = Dio(BaseOptions(
 //   queryParameters: {
 //    "apiKey": _apiKey,
 //   }
 //  ));
 //  dio.interceptors.add(PrettyDioLogger());  /// دا ما هوا الا حاجة توريني api ردت ولا مردتش فا بتظهر عندك في ال run تحت وكلمة interceptors هوا بيقطع يعني وانتا بتعمل رن قبل ما يطهر الحاجة بتاعة ال api هيطهرهالك تحت بس كدا
 static ApiManager? _apiManager ;
 ApiManager._() { /// هنا عملتوا private عشان محدش يستخدموا
  dio = Dio(BaseOptions(
      queryParameters: {
       "apiKey": _apiKey,
      }
  ));
  dio.interceptors.add(PrettyDioLogger()); /// دا ما هوا الا حاجة توريني api ردت ولا مردتش فا بتظهر عندك في ال run تحت وكلمة interceptors هوا بيقطع يعني وانتا بتعمل رن قبل ما يطهر الحاجة بتاعة ال api هيطهرهالك تحت بس كدا
 }

 static ApiManager get instance {
  _apiManager ??= ApiManager._(); /// هوا بيساوي null ؟؟ لو بيساوي null خلاص بقا اعمل اوبجيكت جديد  ApiManager._()
  return _apiManager!;
 }
final String _baseUrl = "https://newsapi.org/v2";
final String _apiKey = "dabd2a221f4c4e05bed99851e4fc8805";


 Future<List<Source>?> loadSources(String language , String category ) async { /// انا عملت category زي الي فات q الي موجودة في ال article  عشان ابعتلها الcategory الي موجودة في ال home
  try{ /// ممكن وارد جدا يرمي exception فا لازم try and catch
   Map<String, dynamic> queryParams = {
    "language": language,
    "category": category
   };


   Response response = await dio.get(/// تاني حاجة نوع بقا dio الي هوا apiRequest نوعوا اية انا هنا نوعوا get وبعديها اخد اللينك بتاعها من ال postman وبعديها ارجع response واعمل await عليها
       "$_baseUrl/top-headlines/sources",
       queryParameters: queryParams
   );


   if(response.statusCode! >= 200 && response.statusCode! < 300){ /// دية عشان اعرف responses دية success ولا لا من طريق status code الي هيا فيها الارقام عشان اعرف هوا اية لو كان 200 وكدا بقا
    SourcesResponse myResponse = SourcesResponse.fromJson(response.data); ///   response.data  بتاعي هوا   الداتا بتاعتي    fromJson
    return myResponse.sources ;  /// هنا انا عايز ارجع ليستة source انا مش عايز  SourcesResponse كلو  انا بس عايز منوا الليستة source
   }
  }catch (e){
     rethrow;
  }
  return null;

 }



  Future<List<Article>?> loadArticles(String sourceId , String language  , String qId ) async {
   try{ /// ممكن وارد جدا يرمي exception فا لازم try and catch

    Map<String, dynamic> queryParams; /// هنا بقولوا لو حولتوا لعربي تدوري علي Article بالعربي ولو انجليزي نفس الكلام
    if (language == 'ar') {
     queryParams = {
      "q": qId, // البحث بالعربي
      "language": language,
     };
    } else {
     queryParams = {
      "sources": sourceId, // المصادر بالإنجليزي
      "language": language,
     };
    }

    Response response = await dio.get( /// تاني حاجة نوع بقا dio الي هوا apiRequest نوعوا اية انا هنا نوعوا get وبعديها اخد اللينك بتاعها من ال postman وبعديها ارجع response واعمل await عليها
        "$_baseUrl/everything",
        queryParameters: queryParams
    );
    if(response.statusCode! >= 200 && response.statusCode! < 300){ /// دية عشان اعرف responses دية success ولا لا من طريق status code الي هيا فيها الارقام عشان اعرف هوا اية لو كان 200 وكدا بقا
     ArticlesResponse myResponse = ArticlesResponse.fromJson(response.data); ///   response.data  بتاعي هوا   الداتا بتاعتي    fromJson
     return myResponse.articles ;  /// هنا انا عايز ارجع ليستة source انا مش عايز  ArticlesResponse كلو  انا بس عايز منوا الليستة articles
    }
   }catch (e){
    rethrow;
   }
   return null;
  }
}
///    Response response = await dio.get( /// تاني حاجة نوع بقا dio الي هوا apiRequest نوعوا اية انا هنا نوعوا get وبعديها اخد اللينك بتاعها من ال postman وبعديها ارجع response واعمل await عليها
//         "$_baseUrl/everything" , queryParameters: { /// ممكن تكتبها كدا او تبعت ال link كلو وخلاص
//          "apiKey" : _apiKey ,
//          "sources" : sourceId ,
//          "language": language ,
//     } ,
//      // "https://newsapi.org//v2/everything?apiKey=dabd2a221f4c4e05bed99851e4fc8805&sources=abc-news" او تعمل كدا

///Response response = await dio.get( /// تاني حاجة نوع بقا dio الي هوا apiRequest نوعوا اية انا هنا نوعوا get وبعديها اخد اللينك بتاعها من ال postman وبعديها ارجع response واعمل await عليها
//        "$_baseUrl/top-headlines/sources" , queryParameters: { /// ممكن تكتبها كدا او تبعت ال link كلو وخلاص
//         "apiKey" : _apiKey
//        } ,
//        // "https://newsapi.org/v2/top-headlines/sources?apiKey=dabd2a221f4c4e05bed99851e4fc8805" او تعمل كدا
//
//    );