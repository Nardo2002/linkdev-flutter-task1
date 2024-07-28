import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/news_viewmodel.dart';
import 'mobile_home_view.dart';
import 'landscape_home_view.dart';
import 'web_home_view.dart';
import '../../widgets/drawer.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});
  final username = 'Tony Roshdy';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsViewModelProvider);
    final newsViewModel = ref.read(newsViewModelProvider.notifier);

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
      body: newsState.when(
        data: (articles) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return MobileLayout(articles: articles);
            } else if (constraints.maxWidth < 1100) {
              return LandscapeLayout(articles: articles);
            } else {
              return WebLayout(
                articles: articles,
                username: username,
              );
            }
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => RefreshIndicator(
          onRefresh: () async {
            newsViewModel.fetchNews();
          },
          child: ListView(
            children: [
              Center(child: Text('Error: $error')),
              const SizedBox(height: 20),
              const Center(child: Text('Pull down to retry')),
            ],
          ),
        ),
      ),
      drawer: MediaQuery.of(context).size.width < 600
          ? CustomDrawer(
              username: username, size: MediaQuery.of(context).size.width * 0.6)
          : MediaQuery.of(context).size.width < 1100
              ? CustomDrawer(
                  username: username,
                  size: MediaQuery.of(context).size.width * 0.5)
              : null,
    );
  }
}
