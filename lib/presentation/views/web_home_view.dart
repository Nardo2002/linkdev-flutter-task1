import 'package:flutter/material.dart';
import 'package:news_app/domain/models/article.dart';
import 'package:news_app/widgets/home_page_article.dart';

class WebLayout extends StatelessWidget {
  final List<Article> articles;
  const WebLayout({required this.articles, super.key});
  final _webScreenSizeRatio = 0.35;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(articles.length, (index) {
        return HomePageArticle(
          article: articles[index],
          size: MediaQuery.of(context).size.width * _webScreenSizeRatio,
        );
      }),
    );
  }
}

