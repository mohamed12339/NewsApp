import 'package:project_news/data/model/source_response.dart';
import 'package:project_news/domain/model/source.dart';

class SourceMapper{ /// انا هنا ممكن اعملوا علي ال chatgpt بتاخد الكلاس بتاع ال domain source وكلاس ال data ال هوا sourceResponse وتحطهم في chatgpt   بس انا عملت كدا عشان افهم

  Source fromDataModel(SourceResponse source){  ///دية هتاخد ال sourceResponse  ترجعوا علي انوا source الي جي من ال domain
    return Source(id:source.id??"" , name: source.name??""  , category: source.category??""  , language: source.language??""  ) ;
  }

  List<Source> fromDataModels(List<SourceResponse> sources){ /// دية هتاخد ليستة من ال sourceResponse ترجعهولي علي انو ليست من ال source
    return sources.map(fromDataModel).toList(); /// عشان احول من ليستة ل ليستة

  }
}