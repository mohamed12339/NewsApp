import 'package:flutter/cupertino.dart';
import 'package:project_news/ui/utilts/app_assets.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';

class CategoryDM{
  String id;
  String text;
  String imagePath;

  CategoryDM(this.id, this.text, this.imagePath);

  static List<CategoryDM> getCategories(BuildContext context  , bool isDarkMode ){  ///
    return [
      CategoryDM("general", context.appLocale.general, !isDarkMode ? AppAssets.generalDark: AppAssets.generalLight),
      CategoryDM("business", context.appLocale.category_business , !isDarkMode ? AppAssets.businessDark: AppAssets.businessLight),
      CategoryDM("sports", context.appLocale.category_sports, !isDarkMode ? AppAssets.sportDark: AppAssets.sportLight),
      CategoryDM("technology", context.appLocale.category_technology, !isDarkMode ? AppAssets.technologyDark: AppAssets.technologyLight),
      CategoryDM("entertainment", context.appLocale.category_entertainment, !isDarkMode ? AppAssets.entertainmentDark: AppAssets.entertainmentLight),
      CategoryDM("health", context.appLocale.category_health, !isDarkMode ? AppAssets.healthDark: AppAssets.healthLight),
      CategoryDM("science", context.appLocale.category_science, !isDarkMode ? AppAssets.scienceDark: AppAssets.scienceLight),

    ];
  }
}