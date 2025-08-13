import 'package:flutter/material.dart';
import 'package:project_news/ui/utilts/app_assets.dart';
import 'package:project_news/ui/utilts/app_routes.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';

class AppScaffold extends StatefulWidget {
  final String appBarTitle;
  final Widget body;

  const AppScaffold({super.key, required this.appBarTitle, required this.body});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder( /// دية حرفيا مهمتها انها بتجبلي context جديدة وانا هنا استخدمتها عشان ال scaffold.of(context) فا كان محتاج context تانية بس
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer(); /// دية بقولوا افتح ال drawer وانا عملت دا اصلا عشان كنت بحاول اغير لون ال drawer بس وطب فية بس  endDrawer بتفتح ال drawer بس لو كنت حاطوا في الناحية التانية علي اليمين
              },
              icon: Icon(Icons.menu, color: context.secondaryColor),
            );
          }
        ),
        title: Text(widget.appBarTitle),
        actions: [
          Padding(
            padding:  EdgeInsets.all(16),
            child: ImageIcon(
              AssetImage(AppAssets.icSearch),
              //color: Theme.of(context).colorScheme.secondary
              color: context.secondaryColor,/// دية هيا اختصار للفوقيها وهيا extention موجودة شرحها في فايل buildExtenstions
            ),
          ),
        ],
      ),
      drawer: buildDrawer(),
      body: widget.body,
    );
  }

  buildDrawer() =>
      Container(
        color: context.primaryColor,
        width: context.width * 0.7,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                AppAssets.newsDrawer,
                width: double.infinity,
                  height: context.height * 0.25,
                  fit: BoxFit.cover,
                ),
                Container(
                    height: context.height * 0.25,
                    color: context.secondaryColor.withValues(alpha: 0.1), ///  withValues is theSameLike withOpacity
                    child: Center(
                        child: Text(
                          "",
                          style: context.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold),))
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    children: [
                      ImageIcon(AssetImage(AppAssets.icGoToHome ), color: context.secondaryColor,),
                      SizedBox(width: 8,) ,
                      InkWell(
                        onTap: (){
                          Navigator.push(context, AppRoutes.home);
                        },
                        child: Text(
                          context.appLocale.goToHome
                          , style: context.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold , color: context.secondaryColor,),
                        ),
                      ),

                    ],
                  ) ,
                  SizedBox(height: 8,) ,
                  Divider(
                    color: context.secondaryColor,
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      ImageIcon(AssetImage(AppAssets.icTheme ), color: context.secondaryColor,),
                      SizedBox(width: 8,) ,
                      Text( context.appLocale.mode
                        , style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold , color: context.secondaryColor,),
                      ),

                    ],
                  ) ,
                  SizedBox(
                    height: 12,
                  ),
                  buildThemeDropDown(),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: context.secondaryColor,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      ImageIcon(AssetImage(AppAssets.icLanguage ), color: context.secondaryColor,),
                      SizedBox(width: 8,) ,
                      Text( context.appLocale.language
                        , style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold , color: context.secondaryColor,),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  buildLanguageDropDown(),
                ],
              ),
            ) ,



          ],
        ),
      );

  buildThemeDropDown() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: context.secondaryColor),
          borderRadius: BorderRadius.circular(16)),
      child: DropdownButton<ThemeMode>( /// هنا دية عشان اعمل حاجة زي bottom sheet تدوس عليها تطلعلك الحاجة مثلا وتغير فيها كدا مثلا علرفتها بالمود عشان اغير المود
        isExpanded: true,
        underline: SizedBox(), /// دية بخفي الخط
        value: context.themeProvider.themeMode,
        dropdownColor: context.primaryColor, /// اللون دا لازم يبقا عكس لون light and dark
        items: [
          DropdownMenuItem( /// دية عاملة زي زرار بتكتب فية الحاجة
            value: ThemeMode.light,
            child: Text(
              "Light",
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.secondaryColor,
              ),
            ),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text(
              "Dark",
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.secondaryColor,
              ),
            ),
          ),
        ],
        onChanged: (newMode) {
          if (newMode == null) return;
          context.themeProvider.changeTheme(newMode);
          //تخزن القيمة الجديدة (newMode) في المتغير themeMode
          ///	المستخدم يغير الاختيار في القائمة →
          // 	onChanged تاخد القيمة (ThemeMode.light أو ThemeMode.dark) →
          // 	تتأكد إنها مش null →
          // 	تبعت القيمة الجديدة للـ ThemeProvider →
          //  ThemeProvider يحدث نفسه وينادي notifyListeners() →
          // 	فا بقولوا من الاخر ان تروح تغير الثيم الي عندك وبس لما المستخدم يدوس
        },
      ),
    );
  }

  buildLanguageDropDown() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: context.secondaryColor),
          borderRadius: BorderRadius.circular(16)),
      child: DropdownButton<String>( /// هنا دية عشان اعمل حاجة زي bottom sheet تدوس عليها تطلعلك الحاجة مثلا وتغير فيها كدا مثلا علرفتها بالمود عشان اغير المود
        isExpanded: true,
        underline: SizedBox(), /// دية بخفي الخط
        value: context.languageProvider.currentLocale,
        dropdownColor: context.primaryColor, /// اللون دا لازم يبقا عكس لون light and dark
        items: [
          DropdownMenuItem( /// دية عاملة زي زرار بتكتب فية الحاجة
            value: "en" ,
            child: Text(
              "English",
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.secondaryColor,
              ),
            ),
          ),
          DropdownMenuItem(
            value: "ar",
            child: Text(
              "Arabic",
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.secondaryColor,
              ),
            ),
          ),
        ],
        onChanged: (newMode) {
          if (newMode == null) return;
          context.languageProvider.changeLanguage(newMode);
          //تخزن القيمة الجديدة (newMode) في المتغير languageProvider
          ///	المستخدم يغير الاختيار في القائمة →
          // 	onChanged تاخد القيمة (languageProvider : en أو languageProvider:ar) →
          // 	تتأكد إنها مش null →
          // 	تبعت القيمة الجديدة للـ languageProvider →
          //  languageProvider يحدث نفسه وينادي notifyListeners() →
          // 	فا بقولوا من الاخر ان تروح تغير languageProvider الي عندك وبس لما المستخدم يدوس
        },
      ),
    );
  }
  }

