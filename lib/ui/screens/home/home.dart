import 'package:flutter/material.dart';
import 'package:project_news/ui/model/category.dm.dart';
import 'package:project_news/ui/utilts/app_colors.dart';
import 'package:project_news/ui/utilts/app_routes.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';
import 'package:project_news/ui/widgets/app_scaffold.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryDM.getCategories( context , context.themeProvider.isDarkMode);

    return AppScaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8 , horizontal: 16),
            child: Text(
                context.appLocale.news_greeting ,
              style: context.textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView.builder(
              itemCount: categories.length ,
              itemBuilder: (context , index){
                return buildCategoryWidget(categories, index, context);
          }
          ))
        ],
      ),
      appBarTitle: context.appLocale.home,
    );
  }

  Widget buildCategoryWidget(List<CategoryDM> categories, int index,
      BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8 , horizontal: 16),
      height: context.height * 0.2,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(categories[index].imagePath), 
              fit: BoxFit.cover,
          ),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Column(
        crossAxisAlignment: index.isEven?CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30 ),
            child: Text(
              categories[index].text,
              style: context.textTheme.titleMedium!.copyWith(
                  color: context.primaryColor,
              ),
            ),
          ),
          index.isEven?
          InkWell(
            onTap: (){
              Navigator.push(context, AppRoutes.news(categories[index])); /// كدا بقا هيروح علي حسب المستخدم هيدوس علي اني واحدة
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30 ),
              decoration:BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(84)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(10),
                    child: Text(context.appLocale.view_all,
                      style: context.textTheme.titleLarge!.copyWith(
                        color: context.secondaryColor,
                      ),),
                  ),
                  CircleAvatar(
                    backgroundColor: context.primaryColor,
                    radius: 24,
                    child: Icon(Icons.arrow_forward_ios , color: context.secondaryColor,),
                  ) ,
                ],
              ),
            ),
          ):
          InkWell(
            onTap: (){
              Navigator.push(context, AppRoutes.news(categories[index]));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30 ),
              decoration:BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(84)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: context.primaryColor,
                    radius: 24,
                    child: Icon(Icons.arrow_back_ios , color: context.secondaryColor,),
                  ) ,
                  Padding(
                    padding:  EdgeInsets.all(10),
                    child: Text(context.appLocale.view_all,
                      style: context.textTheme.titleLarge!.copyWith(
                        color: context.secondaryColor,
                      ),),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
}
