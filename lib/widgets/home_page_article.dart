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
  final _boxPaddingRatio = 0.05;
  final _titleFontSizeRatio = 0.05;
  final _articleFontSizeRatio = 0.03;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size * _boxPaddingRatio),
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [
            if(article.urlToImage != null)
              Image.network(article.urlToImage!),
            Padding(
              padding: EdgeInsets.all(size * _boxPaddingRatio),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title,
                      style: TextStyle(
                          fontSize: size * _titleFontSizeRatio, fontWeight: FontWeight.w300)),
                  Text('By ${article.author}',
                      style:
                          TextStyle(fontSize: size * _articleFontSizeRatio, color: Colors.grey)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(DateFormat.yMMMMd().format(article.publishedAt),
                        style: TextStyle(
                            fontSize: size * _articleFontSizeRatio, color: Colors.grey)),
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
