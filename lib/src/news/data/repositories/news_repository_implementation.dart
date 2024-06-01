

import '../../domain/repositories/news_repository.dart';
import '../datasources/mock_news_data_source.dart';
import '../models/article.dart';


class NewsRepositoryImplementation implements NewsRepository {
  @override
  Future<List<Article>> getLatestArticles() async {
    return mockArticles;
  }

  /// Can throw [StateError]
  @override
  Future<Article> getArticle(String id) async {
    return mockArticles.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<Article>> getFeaturedArticles() async {
    return mockArticles;
  }
}

