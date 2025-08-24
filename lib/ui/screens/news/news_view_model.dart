import 'package:flutter/material.dart';
import 'package:project_news/domain/model/source.dart';
import 'package:project_news/domain/usecases/get_sources_usecase.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';

class NewsViewModel extends ChangeNotifier { /// دا هوا mvvm وشرح دا في الكشكول يعني اية MVVM
  ///انا هناا استخدمت provider:ChangeNotifier   لية عشان دية الحاجة الي ها اعرف اربط بيها newsViewModel ب view الي هوا ال widgets ودا شبية بال observePatterns وشارحوا في الكشكول بردوا


  GetSourcesByCategoryAndLanguageUseCase getSourcesByCategoryAndLanguageUseCase; ///يبقا بقت مهمتها انها تبعت ال source مش الي repository ودا هوا ال use case بتاع domain layer

   //  دا كدا القديم قبل ال domain layer  بقا هيبعت الداتا الي هيبقا موجود فيها ال loadSources بتاع ال api فا هيبقا مكان السطر رقم 20 NewsRepository newsRepository;
  NewsViewModel(this.getSourcesByCategoryAndLanguageUseCase); /// وابعتها في constructor احسن

  List<Source> sources = [];
  var isLoading = false ; ///دول انا عاملهم عشان لو ضرب او حصل حاجة لل api
  var errorMassage = "";

  loadSources(String categoryId , BuildContext context )async{
    try{ /// عملت try and catch عشان اعرف لو ضرب او كدا اية الي حصل
      isLoading = true ;
      notifyListeners();  /// دية زيها زي ال setstate بس دية مع ال provider بس ومينفعش تنساها
      sources = (await getSourcesByCategoryAndLanguageUseCase.execute(categoryId , context.languageProvider.currentLocale ))!; /// انا حطيت ال قوس علي await عشان احط ! علي الحاجة الي راجعة من ال future وهنا كمان getSourcesByCategoryAndLanguageUseCase.execute يبقا بقت مهمتها انها تبعت ال source مش الي repository ودا هوا ال use case بتاع domain layer
      isLoading = false;
      notifyListeners();/// دية زيها زي ال setstate بس دية مع ال provider بس ومينفعش تنساها
    }catch(e){
      errorMassage = e.toString();
    }

  }
}

