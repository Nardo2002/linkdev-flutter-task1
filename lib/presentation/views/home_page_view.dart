import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/news_viewmodel.dart';
import 'mobile_home_view.dart';
import 'landscape_home_view.dart';
import 'web_home_view.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('LINK DEVELOPMENT',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const ImageIcon(AssetImage('assets/images/search.png')),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: newsState.when(
        data: (articles) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return MobileLayout(articles: articles);
            } 
             else if (constraints.maxWidth < 1100) {
              return LandscapeLayout(articles: articles); 
            } else {
              return WebLayout(articles: articles); 
            }
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
