import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_news/data/api_manager.dart';
import 'package:project_news/data/model/article.dart';
import 'package:project_news/data/model/source.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';
import 'package:project_news/ui/widgets/error_view.dart';
import 'package:project_news/ui/widgets/loading_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NewList extends StatefulWidget {
  final Source source ;
  final String searchQuery; // عملت استرينج دا عشان نعمل اليحث


   const NewList({super.key, required this.source, required this.searchQuery});

  @override
  State<NewList> createState() => _NewListState();
}

class _NewListState extends State<NewList> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder( /// دية معملولة مخصوص عشان ترسمللك ال future اي بقا future انتا عاملوا في 3 حالات حالة الfuture لسة بيحمل داتا وحالة انة ضرب ايرور وحالة انو انا  بيجيب داتا
        future: ApiManager.instance.loadArticles(widget.source.id ?? "" , context.languageProvider.currentLocale , context.languageProvider.currentLocale == "ar" ? "مصر" : "Egypt"),  /// بعتلوا اني لو حولت لعربي يجيبلوا الحاجات العربية بس وكمان انا بعتلوا حاجة مرتين عشان للغلة وانوا يجلبي الحاجات بتاعة مصر
        /// انا هنا عملت لل apimanager عملتوا singletonPattern الي ميتكرتش منوا الا نسخة واحدة بس بستخدم في التطبيق كلو   ومحدش يعرف يعمل منوا object

        builder: (context , snapshot){   ///  ال snapshot هيا  الي بتعمل ال 3حالات بتوع ال future ب 3 if condition وكل واحدة معها return بتاعتها
          if(snapshot.hasError){/// في حالة ايرور يبقا اعرضلي ال error
            var error = snapshot.error ;
            return ErrorView(massage: error.toString());
          }else if (snapshot.hasData){/// في حالة الداتا حملت تمم خلاص هارسم ليستة ال articles بس
            var articles = snapshot.data!;
            var searchArticles = articles.where((article) { /// هنا where يعني loop زي islami بيعمل loop علي كل مقال في الليستة لو الشرط رجع صح المقال هيظهر عادي لو مش موجود مش هيظهر حاجة
              return article.title?.toLowerCase().contains(widget.searchQuery.toLowerCase()) ?? false;
              /// وطبعا lowercase هنا ان تعمل بحث بس لو كتبها بحروف صغيرة عشان اكيد مش هتبحث والحروف كبيرة فا هي والحروف ضغيرة برضو هيبحث علي الكبيرة والصغيرة  دا لو العنوان موجود لو مش موجود خلاص مش هيطهر حاجة
            }).toList();

            return buildArticlesList(context, searchArticles);

          }else{  /// هنا في حالة ال loading ها عرض ال widget الي عملتها loadingView
            return  LoadingView();
          }
        }
    );
  }

  Widget buildArticlesList( BuildContext context , List<Article> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context , index) => buildArticlesItem(context  , articles[index]  )
    );
  }

  Widget buildArticlesItem(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: context.secondaryColor,
          context: context,
          isScrollControlled: true,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)
            ),
          ),
          builder: (_) {
            return Padding(
              padding:  EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// صورة
                    if (article.urlToImage != null) ///هنا بقولوا هل في لينك لصورة ال article دا ولا لا فاضية لو فاضية مفيش حاجة بعد دا هيشتغل لكن لو فية صورة هيعرضها
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(article.urlToImage!),/// Image.network(article.urlToImage!), /// دية Image.network  بقا هيجبلي الصورة من api بتاع articles ودية اصلا لما عايز تجيب صورة من api
                      ),
                     SizedBox(height: 12),

                    /// العنوان
                    Text(
                      article.title ?? "",
                      style: context.textTheme.titleMedium!.copyWith(
                          color: context.primaryColor
                      ),
                    ),
                     SizedBox(height: 8),

                    /// الوصف ودا عبارة عن الكلام الي هيتكتب
                    Text(
                      article.description ?? "No description available",
                      style: TextStyle(
                        color: context.primaryColor,
                      ),
                    ),
                     SizedBox(height: 16),

                    /// زرار "View Full Article"
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (article.url == null) return; ///هنا قبل ما افتح اللينك لازم اتاكد انو موجود اصلا لان اكيد مش كل ال articles يبقا عندها website بس يعني لو null هيرجع تاني علي الصفحة مش هيعمل حاجة انما لو مش ب null  هيفتح بقا ال website
                          final Uri uri = Uri.parse(article.url!); /// انا خدت article.uri الي هوا سترينج حولتوا ل URI لية عشان دية مفهومة لكتير من packeges وببتعامل معاهم
                          /// Uri =  دية معناة بيحدد مكان المورد بعمني انو بيحدد زي لينك الصفحة او الصورة وكدا عشان يجبهوللك يعني اكني بكتب حاجة في سيرش جوجل كروم وبيجيبلي الموقع وكدا

                          await launchUrl(  /// زي هنا مثلا دية تبع باكدج اسمها  url_launcher فا بتسخدم معها Uri فالازم كنت اعمل السطر الي قبليها دا
                            uri,
                            mode: LaunchMode.externalApplication, /// دية بقا معناها افتح اللينك من برة app news خالص علي websites بقا safari او chrome
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.primaryColor,
                          padding:  EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          context.appLocale.view_full_article,
                          style: TextStyle(color:context.secondaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
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

      ),
    );
  }
}
