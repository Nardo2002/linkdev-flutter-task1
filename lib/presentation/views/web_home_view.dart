import 'package:flutter/material.dart';
import 'package:news_app/domain/models/article.dart';
import 'package:news_app/widgets/home_page_article.dart';
import 'package:news_app/widgets/drawer_tile.dart';

class WebLayout extends StatelessWidget {
  final List<Article> articles;
  final double size;
  final String username;
  const WebLayout(
      {required this.articles,
      required this.size,
      required this.username,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size * 0.7,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(size * 0.05),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/images/profile.png'),
                    radius: size * 0.07,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size * 0.035),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                color: Colors.grey, fontSize: size * 0.025),
                          ),
                          Text(
                            username,
                            style: TextStyle(
                                color: Colors.black, fontSize: size * 0.045),
                          ),
                        ]),
                  ),
                  const ImageIcon(
                    AssetImage('assets/images/arrow.png'),
                  )
                ],
              ),
            ),
            DrawerTile(
              title: 'Explore',
              icon: ImageIcon(AssetImage('assets/images/explore.png')),
              size: size,
            ),
            DrawerTile(
              title: 'Live Chat',
              icon: ImageIcon(AssetImage('assets/images/live.png')),
              size: size,
            ),
            DrawerTile(
              title: 'Gallery',
              icon: ImageIcon(AssetImage('assets/images/gallery.png')),
              size: size,
            ),
            DrawerTile(
              title: 'Whish List',
              icon: ImageIcon(AssetImage('assets/images/wishlist.png')),
              size: size,
            ),
            DrawerTile(
              title: 'E-Magazine',
              icon: ImageIcon(AssetImage('assets/images/e-magazine.png')),
              size: size,
            ),
          ]),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(articles.length, (index) {
              return HomePageArticle(
                article: articles[index],
                size: MediaQuery.of(context).size.width * 0.3,
              );
            }),
          ),
        ),
      ],
    );
  }
}
