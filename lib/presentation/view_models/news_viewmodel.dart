import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/article.dart';
import '../../domain/usecases/get_news.dart';
import '../../data/repositories/news_repository.dart';
import '../../core/network/api_client.dart';
import 'package:http/http.dart' as http;


class NewsViewModel extends StateNotifier<AsyncValue<List<Article>>> {
  final GetNews getNews;

  NewsViewModel({required this.getNews}) : super(const AsyncValue.loading()) {
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final articles = await getNews();
      state = AsyncValue.data(articles);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final newsViewModelProvider = StateNotifierProvider<NewsViewModel, AsyncValue<List<Article>>>((ref) {
  final getNews = ref.read(getNewsProvider);
  return NewsViewModel(getNews: getNews);
});

final getNewsProvider = Provider<GetNews>((ref) {
  final newsRepository = ref.read(newsRepositoryProvider);
  return GetNews(repository: newsRepository);
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return NewsRepository(apiClient: apiClient);
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final httpClient = ref.read(httpClientProvider);
  return ApiClient(httpClient: httpClient);
});

final httpClientProvider = Provider<http.Client>((ref) => http.Client());
