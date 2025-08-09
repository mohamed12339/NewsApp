import 'package:flutter/material.dart';
import 'package:project_news/ui/utilts/app_colors.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(

      primaryColor: AppColors.white, ///دية معناها لون الي علي طول موجود في الابلكيشن كلو وانتا بتسخدموا علي طول يعني لو عملتو ال app light هيبقا ابيض

      colorScheme: ColorScheme.fromSeed( ///دية معناها اني هديللك لون وطلع انتا منوا باقي الالوان التانية
          seedColor: AppColors.white, /// دا اللون الي بتبني علية كل حاجة
          primary: AppColors.white,
          secondary: AppColors.black), /// اللون المساعد أو اللون المكمّل، يعني primary مثلا ابيض فا كدا معظم الحاجات فاتحة فا لازم  يكون عكس اللون الأساسي علشان التباين والوضوح لباقي الحاجة

      scaffoldBackgroundColor: AppColors.white, /// هنا لون الشاشة هتبقا ابيض

      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.white,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black)),

      textTheme: TextTheme(  /// دا هوا كل انواع ال text بتاعة ال app
          titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
          titleMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
          bodyLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
          bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black),
          bodySmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
          labelLarge: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
          labelMedium: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.grey)),

      iconTheme: IconThemeData( /// دية عشان نظبط الوان الايكون في البروجيكت كلو وحجموا وكدا
          size: 24,
          color: AppColors.black
      )
  );


  static ThemeData darkTheme = ThemeData(

      primaryColor: AppColors.black, ///دية معناها لون الي علي طول موجود في الابلكيشن كلو وانتا بتسخدموا علي طول يعني لو عملتو ال app dark  هيبقا اسود

      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black,
          primary: AppColors.black,
          secondary: AppColors.white),

      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.black,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.white)),

      scaffoldBackgroundColor: AppColors.black,/// هنا لون الشاشة هتبقا اسود

      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
          titleMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
          bodyLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
          bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
          bodySmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
          labelLarge: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
          labelMedium: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.grey)),

      iconTheme: IconThemeData(
          size: 24,
          color: AppColors.white
      ));
}