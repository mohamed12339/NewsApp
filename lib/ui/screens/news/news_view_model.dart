import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_news/domain/model/source.dart';
import 'package:project_news/domain/usecases/get_sources_usecase.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';

class NewsViewModel extends Cubit<NewsState> { /// شرح ال cubit وال bloc وال provider بردو في الكشكول حتة ال newsState تحت اهية في سطر 34
  /// دا هوا mvvm وشرح دا في الكشكول يعني اية MVVM
  ///انا هناا استخدمت provider:ChangeNotifier   لية عشان دية الحاجة الي ها اعرف اربط بيها newsViewModel ب view الي هوا ال widgets ودا شبية بال observePatterns وشارحوا في الكشكول بردوا

  GetSourcesByCategoryAndLanguageUseCase getSourcesByCategoryAndLanguageUseCase; ///يبقا بقت مهمتها انها تبعت ال source مش الي repository ودا هوا ال use case بتاع domain layer

   //  دا كدا القديم قبل ال domain layer  بقا هيبعت الداتا الي هيبقا موجود فيها ال loadSources بتاع ال api فا هيبقا مكان السطر رقم 20 NewsRepository newsRepository;

  NewsViewModel(this.getSourcesByCategoryAndLanguageUseCase) : super(NewsState.initial());   /// وابعتها في constructor احسن وهنا مادام بعت لل cubit حاجة مثلا اي كان مكتوب اية هنا <> لازم تعمل super تقولوا انا هاعمل اية اية الانا هاعملوا وهاكتبوا عشان انا هابدا باية وتعرفني كل حاجة جواة newState كل حاجة هاتعمل اية بس

  List<Source> sources = [];
  var isLoading = false ; ///دول انا عاملهم عشان لو ضرب او حصل حاجة لل api
  var errorMassage = "";

  loadSources(String categoryId , BuildContext context )async{
    try{ /// عملت try and catch عشان اعرف لو ضرب او كدا اية الي حصل
     // isLoading = true ;
      // دية notifyListeners(); زيها زي ال setstate بس دية مع ال provider بس ومينفعش تنساها

      emit(NewsState(sources: [],  isLoading: true , errorMassage: "",));  /// ال emit هنا زي ال notifyListeners وال setstate بالظبط الفرق انتا بس عرفتوا الحاجة جواة ال emit يعني لو كتبت في ال cubit <> هنا كتبت int تبعت ارقام انما هنا انا باعت newState فا تبعت الحاجة علي لو كانت ال loading ب true ييقا sources and errorMassege كدا بقا وهكزا في الباقي
      sources = (await getSourcesByCategoryAndLanguageUseCase.execute(categoryId , context.languageProvider.currentLocale ))!; /// انا حطيت ال قوس علي await عشان احط ! علي الحاجة الي راجعة من ال future وهنا كمان getSourcesByCategoryAndLanguageUseCase.execute يبقا بقت مهمتها انها تبعت ال source مش الي repository ودا هوا ال use case بتاع domain layer
     // isLoading = false;
      // دية notifyListeners(); زيها زي ال setstate بس دية مع ال provider بس ومينفعش تنساها

      emit(NewsState(sources: sources,  isLoading: false , errorMassage: "",));  /// زي الانا كاتبوا سطر 26 بالظبط هنا كدا

    }catch(e){
     // errorMassage = e.toString();
      // notifyListeners();

      emit(NewsState(sources: [],  isLoading: false , errorMassage: e.toString(),));/// زي الانا كاتبوا سطر 26 بالظبط هنا كدا

    }

  }
}

class NewsState { /// عشان ال cubit بتاخد حاجة اسمها state زي ال bloc بس ال bloc بتاخد event لكن هنا بعمل كلاس state بياخد مني الحاجة  الانا عايز اغيرها variables بقا اي حاجة تروح عاملها كلاس ب 2 constructor
  List<Source> sources = [];
  var isLoading = false ; ///دول انا عاملهم عشان لو ضرب او حصل حاجة لل api
  var errorMassage = "";
  NewsState({required this.sources , required this.isLoading , required this.errorMassage});

  NewsState.initial({this.sources = const [], this.isLoading = false, this.errorMassage = ""}); /// دا الي هاكتبوا في ال super عشان اعرفوا كل var هيعمل اية بس

}


// class NewsViewModel extends ChangeNotifier {
//   /// دا هوا mvvm وشرح دا في الكشكول يعني اية MVVM
//   ///انا هناا استخدمت provider:ChangeNotifier   لية عشان دية الحاجة الي ها اعرف اربط بيها newsViewModel ب view الي هوا ال widgets ودا شبية بال observePatterns وشارحوا في الكشكول بردوا
//
//
//   GetSourcesByCategoryAndLanguageUseCase getSourcesByCategoryAndLanguageUseCase; ///يبقا بقت مهمتها انها تبعت ال source مش الي repository ودا هوا ال use case بتاع domain layer
//
//   //  دا كدا القديم قبل ال domain layer  بقا هيبعت الداتا الي هيبقا موجود فيها ال loadSources بتاع ال api فا هيبقا مكان السطر رقم 20 NewsRepository newsRepository;
//   NewsViewModel(this.getSourcesByCategoryAndLanguageUseCase); /// وابعتها في constructor احسن
//
//   List<Source> sources = [];
//   var isLoading = false ; ///دول انا عاملهم عشان لو ضرب او حصل حاجة لل api
//   var errorMassage = "";
//
//   loadSources(String categoryId , BuildContext context )async{
//     try{ /// عملت try and catch عشان اعرف لو ضرب او كدا اية الي حصل
//       isLoading = true ;
//       notifyListeners();  /// دية زيها زي ال setstate بس دية مع ال provider بس ومينفعش تنساها
//       sources = (await getSourcesByCategoryAndLanguageUseCase.execute(categoryId , context.languageProvider.currentLocale ))!; /// انا حطيت ال قوس علي await عشان احط ! علي الحاجة الي راجعة من ال future وهنا كمان getSourcesByCategoryAndLanguageUseCase.execute يبقا بقت مهمتها انها تبعت ال source مش الي repository ودا هوا ال use case بتاع domain layer
//       isLoading = false;
//       notifyListeners();/// دية زيها زي ال setstate بس دية مع ال provider بس ومينفعش تنساها
//     }catch(e){
//       errorMassage = e.toString();
//     }
//
//   }
// }