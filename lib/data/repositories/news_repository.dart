import 'dart:convert';
import 'package:news_app/core/network/api_client.dart';
import 'package:news_app/domain/models/article.dart';

class NewsRepository {
  final ApiClient apiClient;

  NewsRepository({required this.apiClient});

  Future<List<Article>> getNews() async {
    final data = await apiClient.fetchNews();
    final jsonData = jsonDecode(data);
    if (jsonData.containsKey('articles')) {
      final List<dynamic> articlesJson = jsonData['articles'];
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('There are no articles');
    }
  }
}
