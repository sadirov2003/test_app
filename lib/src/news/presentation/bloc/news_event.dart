// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data/models/article.dart';

abstract class NewsEvent {}

class NewsInitialEvent extends NewsEvent {}

class NewsButtonNavigateEvent extends NewsEvent {
  final Article clickedArticleModel;
  NewsButtonNavigateEvent({
    required this.clickedArticleModel,
  });
}

class NewsResetEvent extends NewsEvent {
  final Article? articleModel;
  bool clickedMakeAll;
  NewsResetEvent({
    this.articleModel,
    this.clickedMakeAll = false,
  });
}
