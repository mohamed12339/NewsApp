import 'package:flutter/material.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'source_response.dart';

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? SourceResponse.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  SourceResponse? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
  String getTimeAgo(String dateString , BuildContext context ) { /// دية عشان اغير الوقت بتاع published at الي كانت الساعة مكتوبة كدا  "2025-08-12T05:33:12Z" حولتها لكدا تبقا بال minute or day or hoursAgo كدا الفانكشن دية مهمتها كدا ونزلت package timeago هيا الي بتعمل كدا
    try {
      final dateTime = DateTime.parse(dateString);
      return timeago.format(dateTime, locale: context.languageProvider.currentLocale ); // أو 'ar' لو عايز عربي
    } catch (e) {
      return "";
    }
  }

}