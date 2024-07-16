import 'package:flutter/material.dart';
import 'package:news_app/domain/models/article.dart';
import 'package:intl/intl.dart';

class HomePageArticle extends StatelessWidget {
  const HomePageArticle({
    super.key,
    required this.article,
    required this.size,
  });

  final Article article;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size * 0.05),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(
              padding: EdgeInsets.all(size * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title,
                      style: TextStyle(
                          fontSize: size * 0.05,
                          fontWeight: FontWeight.w300)),
                  Text('By ${article.author}',
                      style: TextStyle(
                          fontSize: size * 0.03,
                          color: Colors.grey)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(DateFormat.yMMMMd().format(article.publishedAt), style: TextStyle(
                            fontSize: size * 0.03,
                            color: Colors.grey)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
