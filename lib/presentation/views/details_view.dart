import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends ConsumerWidget {
  final Article article;
  final double size;
  const DetailsView({required this.article, required this.size, super.key});

  Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(size * 0.05),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          width: size * 0.9,
                          height: size * 0.5,
                          child: Image.network(
                            article.urlToImage,
                          )),
                      Padding(
                        padding: EdgeInsets.all(size * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(article.title,
                                style: TextStyle(
                                    fontSize: size * 0.05,
                                    fontWeight: FontWeight.w300)),
                            Text('By ${article.author}',
                                style: TextStyle(
                                    fontSize: size * 0.03, color: Colors.grey)),
                            Text(article.description,
                                style: TextStyle(
                                    fontSize: size * 0.03, color: Colors.grey))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    _launchUrl(Uri.parse(article.url));
                  },
                  child: Text('OPEN WEBSITE',
                      style: TextStyle(
                          fontSize: size * 0.04, color: Colors.white, fontWeight: FontWeight.w300)),
                ),
              )
            ],
          ),
        ));
  }
}
