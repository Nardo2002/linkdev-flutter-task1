import 'package:flutter/material.dart';
import 'package:news_app/domain/models/article.dart';
import 'package:news_app/widgets/home_page_article.dart';

class MobileLayout extends StatelessWidget {
  final List<Article> articles;
  const MobileLayout({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return HomePageArticle(
          article: articles[index],
          size: MediaQuery.of(context).size.width,
        );
      },
    );
  }
}
