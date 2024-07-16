import '../../data/repositories/news_repository.dart';
import '../models/article.dart';

class GetNews {
  final NewsRepository repository;

  GetNews({required this.repository});

  Future<List<Article>> call() async {
    try {
      return await repository.getNews();
    } catch (e) {
      rethrow;
    }
  }
}
