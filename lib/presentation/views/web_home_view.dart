import 'package:flutter/material.dart';
import 'package:news_app/domain/models/article.dart';
import 'package:news_app/widgets/home_page_article.dart';
import '../../widgets/drawer.dart';

class WebLayout extends StatelessWidget {
  final List<Article> articles;
  final String username;
  final _webDrawerSizeRatio = 0.2;
  final _webSizeRatio = 0.27;
  const WebLayout(
      {required this.articles,
      required this.username,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomDrawer(username: username, size:  MediaQuery.of(context).size.width * _webDrawerSizeRatio),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(articles.length, (index) {
              return HomePageArticle(
                article: articles[index],
                size: MediaQuery.of(context).size.width * _webSizeRatio,
              );
            }),
          ),
        ),
      ],
    );
  }
}
