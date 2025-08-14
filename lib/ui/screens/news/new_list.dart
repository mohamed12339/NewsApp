import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_news/data/model/api_manager.dart';
import 'package:project_news/data/model/article.dart';
import 'package:project_news/data/model/source.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';
import 'package:project_news/ui/widgets/error_view.dart';
import 'package:project_news/ui/widgets/loading_view.dart';

class NewList extends StatelessWidget {
  final Source source ;


   const NewList({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder( /// دية معملولة مخصوص عشان ترسمللك ال future اي بقا future انتا عاملوا في 3 حالات حالة الfuture لسة بيحمل داتا وحالة انة ضرب ايرور وحالة انو انا  بيجيب داتا
        future: ApiManager.instance.loadArticles(source.id ?? "" , context.languageProvider.currentLocale , context.languageProvider.currentLocale == "ar" ? "مصر" : "Egypt"),  /// بعتلوا اني لو حولت لعربي يجيبلوا الحاجات العربية بس وكمان انا بعتلوا حاجة مرتين عشان للغلة وانوا يجلبي الحاجات بتاعة مصر
        /// انا هنا عملت لل apimanager عملتوا singletonPattern الي ميتكرتش منوا الا نسخة واحدة بس بستخدم في التطبيق كلو   ومحدش يعرف يعمل منوا object

        builder: (context , snapshot){   ///  ال snapshot هيا  الي بتعمل ال 3حالات بتوع ال future ب 3 if condition وكل واحدة معها return بتاعتها
          if(snapshot.hasError){/// في حالة ايرور يبقا اعرضلي ال error
            var error = snapshot.error ;
            return ErrorView(massage: error.toString());
          }else if (snapshot.hasData){/// في حالة الداتا حملت تمم خلاص هارسم ليستة ال articles بس
            var articles = snapshot.data!;
            return buildArticlesList( context, articles );
          }else{  /// هنا في حالة ال loading ها عرض ال widget الي عملتها loadingView
            return  LoadingView();
          }
        }
    );
  }

  buildArticlesList( BuildContext context , List<Article> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context , index) => buildArticlesItem(context  , articles[index]  )
    );
  }

  Widget buildArticlesItem(BuildContext context, Article article) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: context.secondaryColor),
          borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              placeholder: (_, _) => LoadingView(),
              errorWidget: (_,_ , _)=>Icon(Icons.error),
              height: context.height * 0.25,

          ),
          // Image.network(article.urlToImage??""), /// دية Image.network  بقا هيجبلي الصورة من api بتاع articles ودية اصلا لما عايز تجيب صورة من api
          Text(article.title ?? "", style: context.textTheme.bodyMedium,),
          Row(
            children: [
              Expanded(
                child: Text(
                  article.author ?? "",
                  style: context.textTheme.labelMedium,
                ),
              ),
              Text(
                article.getTimeAgo(article.publishedAt ?? ''  , context), /// دية عشان اغير الوقت بتاع published at الي كانت الساعة مكتوبة كدا  "2025-08-12T05:33:12Z" حولتها لكدا تبقا بال minute or day or hoursAgo فا عملت الفانكشن في ال article  دية مهمتها كدا ونزلت package timeago هيا الي بتعمل كدا
                style: context.textTheme.labelMedium,

              )
            ],
          )
        ],
      ),

    );
  }
}
