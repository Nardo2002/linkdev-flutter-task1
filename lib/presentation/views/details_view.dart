import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends ConsumerWidget {
  final Article article;
  final double size;
  final _largeSizeRatio = 0.05;
  final _smallSizeRatio = 0.03;
  final _widthRatio = 0.9;
  final _buttonFontSizeRatio = 0.04;
  const DetailsView({required this.article, required this.size, super.key});

  Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LINK DEVELOPMENT',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: const ImageIcon(AssetImage('assets/images/search.png')),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(size * _largeSizeRatio),
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      if (article.urlToImage != null)
                        Image.network(
                          article.urlToImage,
                          height: size * 0.5,
                          fit: BoxFit.contain,
                        ),
                      Padding(
                        padding: EdgeInsets.all(size * _smallSizeRatio),
                        child: SizedBox(
                          width: size * _widthRatio,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(article.title,
                                  style: TextStyle(
                                      fontSize: size * _largeSizeRatio,
                                      fontWeight: FontWeight.w300)),
                              Text('By ${article.author}',
                                  style: TextStyle(
                                      fontSize: size * _smallSizeRatio, color: Colors.grey)),
                              Text(article.description,
                                  style: TextStyle(
                                      fontSize: size * _smallSizeRatio, color: Colors.grey))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size * _widthRatio,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      _launchUrl(Uri.parse(article.url));
                    },
                    child: Text('OPEN WEBSITE',
                        style: TextStyle(
                            fontSize: size * _buttonFontSizeRatio, color: Colors.white, fontWeight: FontWeight.w300)),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
