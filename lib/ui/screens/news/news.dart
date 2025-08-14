import 'package:flutter/material.dart';
import 'package:project_news/data/model/api_manager.dart';
import 'package:project_news/data/model/source.dart';
import 'package:project_news/ui/model/category.dm.dart';
import 'package:project_news/ui/screens/news/new_list.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';
import 'package:project_news/ui/widgets/app_scaffold.dart';
import 'package:project_news/ui/widgets/error_view.dart';
import 'package:project_news/ui/widgets/loading_view.dart';

class News extends StatelessWidget {
final CategoryDM categoryDM ;

   News({super.key, required this.categoryDM});

  final ApiManager apiManager =  ApiManager();

  @override
  Widget build(BuildContext context) {
    return  AppScaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder( /// دية معملولة مخصوص عشان ترسمللك ال future اي بقا future انتا عاملوا في 3 حالات حالة الfuture لسة بيحمل داتا وحالة انة ضرب ايرور وحالة انو انا  بيجيب داتا
                future: apiManager.loadSources( context.languageProvider.currentLocale ,categoryDM.id), /// كدا انا بعت ال categoray لما المستخدم يدوس علي حاجة من الي موجودين في ال home وكمان بعتلوا اني لو حولت لعربي يجيبلوا الحاجات العربية بس
                builder: (context , snapshot){   ///  ال snapshot هيا  الي بتعمل ال 3حالات بتوع ال future ب 3 if condition وكل واحدة معها return بتاعتها
                  if(snapshot.hasError){/// في حالة ايرور يبقا اعرضلي ال error
                    var error = snapshot.error ;
                    return ErrorView(massage: error.toString());
                  }else if (snapshot.hasData){/// في حالة الداتا حملت تمم خلاص هارسم ليستة ال sources بس
                    var sources = snapshot.data!;
                    return buildTabsList(context , sources);
                  }else{  /// هنا في حالة ال loading ها عرض ال widget الي عملتها loadingView
                    return Center(child: LoadingView());
                  }
                }
            ),
          ),
        ],
      ),
      appBarTitle: context.appLocale.general,
    );
  }

  buildTabsList( BuildContext context , List<Source> sources ) {
    return DefaultTabController( //	DefaultTabController هو المسئول عن التحكم في تبادل التابات، لازم تحدد length بعدد التابات.
    length: sources.length,
      child: Column(
        children: [
          TabBar( //	TabBar: هو الودجت اللي بيعرض التابات نفسها.
              isScrollable: true ,
              indicatorColor: context.secondaryColor, //لون الخط اللي تحت التاب اللي معمول له اختيار (أنا خليته علي حسب لون الثيم )
              dividerColor: Colors.transparent,//لو فيه خط بين التابات، أنا لغيت الخط هنا
              labelStyle: context.textTheme.bodyMedium, // الي دوست عليها هيبقا خطها كبير
              unselectedLabelStyle: context.textTheme.bodySmall, // الي مدوستش عليها هيبقا خطها صغير
              tabAlignment: TabAlignment.start, //طريقة محاذاة التابات (انا مختارها تبدأ من الشمال start)
              tabs: sources.map((source) => mapSourceToTab(source)).toList() //معناها:
          // 	1.	خد كل عنصر في sources (وهو Source بتاع فايل ال model )
          // 	2.	ابعته لدالة mapSourceToTab
          // 	3.	حول كل عنصر لـ Tab
          // 	4.	استخدم .toList() علشان ترجعهم كليست Tabs
          //  النتيجة: كل عنصر من sources بيتحول لـ Tab بالشكل اللي انا عايزه

          ),
          Expanded(child: TabBarView(children: sources.map((source) => NewList(source : source)).toList())) ///  هنا دية TabBarView عبارة عن كل tab موجودة الي هيا هتبقا فيها الحاجة بتاعة الصور والكلام وكل دا يعني هيا ويدجيت بتاعة كل tab من الي 200 ال مكتوبين دول في ال tabBar
          ///  زي ما انا اديتوا ليستة  التابز  الي هيا في سطر 53 انا كمان قولتوا خد نفس اليستة بس اديتو لستة الي هاعرض فيها الاخبار بس وبعديها اروح ارسمها في فايل نيوزليست   sources.map((source) => NewList(source : source)).toList
        ],
      ),

    );
  }

  Widget mapSourceToTab(Source source) { // هنا بقا شكل ال tab لاني المفروض بعتلوا الدالة دية عشان ارسم ال tab
    return Tab(
      text: source.name,
    );
  }
}
