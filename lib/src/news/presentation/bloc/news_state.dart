// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_news_app/src/news/data/models/article.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<Article> featuredData;
  final List<Article> latestData;

  NewsLoadedState({
    required this.featuredData,
    required this.latestData,
  });
}

class NewsErrorState extends NewsState {}

abstract class NewsActionState extends NewsState {}

class NewsNavigateToDetailedPageActionState extends NewsActionState {
  final Article articleModel;
  NewsNavigateToDetailedPageActionState({
    required this.articleModel,
  });
  
}
