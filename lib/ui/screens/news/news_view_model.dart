import 'package:flutter/material.dart';
import 'package:project_news/data/model/source.dart';
import 'package:project_news/data/model/api_manager.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';

class NewsViewModel extends ChangeNotifier { /// دا هوا mvvm وشرح دا في الكشكول يعني اية MVVM
  ///انا هناا استخدمت provider:ChangeNotifier   لية عشان دية الحاجة الي ها اعرف اربط بيها newsViewModel ب view الي هوا ال widgets ودا شبية بال observePatterns وشارحوا في الكشكول بردوا
  List<Source> sources = [];
  var isLoading = false ; ///دول انا عاملهم عشان لو ضرب او حصل حاجة لل api
  var errorMassage = "";

  loadSources(String categoryId , BuildContext context )async{
    try{ /// عملت try and catch عشان اعرف لو ضرب او كدا اية الي حصل
      isLoading = true ;
      notifyListeners();  /// دية زيها زي ال setstate بس دية مع ال provider بس ومينفعش تنساها
      sources = (await ApiManager.instance.loadSources( context.languageProvider.currentLocale ,categoryId))!; /// انا حطيت ال قوس علي await عشان احط ! علي الحاجة الي راجعة من ال future
      isLoading = false;
      notifyListeners();/// دية زيها زي ال setstate بس دية مع ال provider بس ومينفعش تنساها
    }catch(e){
      errorMassage = e.toString();
    }

  }
}

