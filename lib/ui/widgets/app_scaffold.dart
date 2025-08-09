import 'package:flutter/material.dart';
import 'package:project_news/ui/utilts/app_assets.dart';
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
          ImageIcon(
            AssetImage(AppAssets.icSearch),
            //color: Theme.of(context).colorScheme.secondary
            color: context.secondaryColor,/// دية هيا اختصار للفوقيها وهيا extention موجودة شرحها في فايل buildExtenstions
          ),
        ],
      ),
      drawer: buildDrawer(),
      body: widget.body,
    );
  }

  buildDrawer() =>
      Container(
        color: context.secondaryColor,
        width: context.width * 0.7,
        child: Column(
          children: [
            Container(
                height: context.height * 0.25,
                color: context.primaryColor,
                child: Center(
                    child: Text(
                   "News App",
                  style: context.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold),))
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    children: [
                      ImageIcon(AssetImage(AppAssets.icGoToHome ), color: context.primaryColor,),
                      SizedBox(width: 8,) ,
                      Text( "Go To Home"
                        , style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold , color: context.primaryColor,),
                      ),

                    ],
                  ) ,
                  SizedBox(height: 8,) ,
                  Divider(
                    color: context.primaryColor,
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      ImageIcon(AssetImage(AppAssets.icTheme ), color: context.primaryColor,),
                      SizedBox(width: 8,) ,
                      Text( "Theme"
                        , style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold , color: context.primaryColor,),
                      ),

                    ],
                  ) ,
                  SizedBox(
                    height: 12,
                  ),
                  buildThemeDropDown(),
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
          border: Border.all(color: context.primaryColor),
          borderRadius: BorderRadius.circular(16)),
      child: DropdownButton<ThemeMode>(
        isExpanded: true,
        underline: SizedBox(),
        value: context.themeProvider.themeMode,
        dropdownColor: context.secondaryColor,
        items: [
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text(
              "Light",
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.primaryColor,
              ),
            ),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text(
              "Dark",
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.primaryColor,
              ),
            ),
          ),
        ],
        onChanged: (newMode) {
          if (newMode == null) return;
          context.themeProvider.changeTheme(newMode);
        },
      ),
    );
  }
  }

