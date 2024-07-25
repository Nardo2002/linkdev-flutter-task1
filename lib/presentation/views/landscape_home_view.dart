import 'package:flutter/material.dart';
import 'package:news_app/domain/models/article.dart';
import 'package:news_app/widgets/home_page_article.dart';

class LandscapeLayout extends StatelessWidget {
  final List<Article> articles;
  const LandscapeLayout({required this.articles, super.key});
  final _landscapeSizeRatio = 0.55;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(articles.length, (index) {
        return HomePageArticle(
          article: articles[index],
          size: MediaQuery.of(context).size.width * _landscapeSizeRatio,
        );
      }),
    );
  }
}

