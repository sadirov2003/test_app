import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/news/data/models/article.dart';
import 'package:flutter_news_app/src/news/data/repositories/news_repository_implementation.dart';
import 'package:flutter_news_app/src/news/domain/repositories/news_repository.dart';
import 'package:flutter_news_app/src/news/presentation/bloc/news_event.dart';
import 'package:flutter_news_app/src/news/presentation/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository = NewsRepositoryImplementation();
  List<Article> featuredNews = [];
  List<Article> latestNews = [];
  NewsBloc() : super(NewsInitial()) {
    on<NewsInitialEvent>(newsInitialEvent);
    on<NewsButtonNavigateEvent>(newsButtonNavigateEvent);
  }

  FutureOr<void> newsInitialEvent(NewsInitialEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoadingState());
    //await Future.delayed(const Duration(seconds: 5));
    featuredNews = await newsRepository.getFeaturedArticles();
    latestNews = await newsRepository.getLatestArticles();
    emit(
      NewsLoadedState(featuredData: featuredNews, latestData: latestNews),
    );
  }

  FutureOr<void> newsButtonNavigateEvent(NewsButtonNavigateEvent event, Emitter<NewsState> emit) {
    
    emit(NewsNavigateToDetailedPageActionState(articleModel: event.clickedArticleModel));
  }
}
