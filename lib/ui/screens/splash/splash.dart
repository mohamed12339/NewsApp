import 'package:flutter/material.dart';
import 'package:project_news/ui/utilts/app_routes.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2) , () {  /// future.delayed the same like Timer.periodic  بالظبط
      if(mounted){  /// هنا معنا ال mounted هنا بقولوا اتاكد ان المستخدم معملش حاجة غريبة زي ما انا حاطط الثانتين دول ميكونش قفل ال app ميكونش عمل حاجة تانية مثلا وبردوا بستخدمها لان ال ؤخىفثءف بتدي انزار كدا مع future and async لية لان دية بيتبقا حاجة شغالة وبتاخد وقت وهيا بتشتغل وكمان بردوا مع ال await لان دول بياخدوا وقت شوية فا لازم تعمل mounted
       Navigator.push(context, AppRoutes.home );
      }
    },);
  }


  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      body: Image.asset(
          context.themeProvider.providerSplashMode ,   /// فانكشن providerSplashMode  مكتوبة في فايل ال theme provider  وال context دية بتاعة ال extenstions
        fit: BoxFit.cover,
        width: double.infinity, /// عشان تاخخد العرض كلو وبرد لو حطيت لون في السكفولد يظهر
        height: double.infinity,
      ),
    );
  }
}
