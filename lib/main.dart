import 'package:flutter/material.dart';
import 'package:project_news/ui/providers/theme_provider.dart';
import 'package:project_news/ui/screens/home/home.dart';
import 'package:project_news/ui/utilts/app_theme.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(ChangeNotifierProvider(create: (_) => ThemeProvider(), child:  MyApp()));  ///انا كتبت دية عشان اقدر استخم ال provider والابلكيشن اقدر اربطوا كلو مش الي كنت بعملها في  فايل يعني بدل setstateالي بتتعمل في فايل واحد وللحاجة معينة والاهم اني عملت extends changeNotifier عشان اقدر استخدم فايل ال Theme provider مكتوبة هناك
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeProvider themeProvider ;  ///هنا انا لازم اعملها late عشان اعرفوا انا هاعملها زي الانا كاتبها عند ال build زي ما انا عامل في evently app مثلا
   /// ممكن كمان تعرفوا في didChangeDependencies عادي بدل ال build
  @override
  void didChangeDependencies() { ///امتى بنتنادي عليها  مباشرة بعد initState()، وقبل ال build وبردو لما تتغير تبعيات InheritedWidget (مثل MediaQuery, Theme, Provider، الخ)
    // 		امتى استخدمتها:  لما  عايز اجيب حاجة  من InheritedWidget    او بردو  لو انا محتاج  لإعادة تهيئة حاجة  زي  تغيير اللغة أو الثيم
    super.didChangeDependencies();
    themeProvider = Provider.of(context);

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: Home(),
    );
  }
}

