class Article {
  final String title;
  final String description;
  final String author;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;

  Article({required this.title, required this.description, required this.author, required this.url, required this.urlToImage, required this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json.containsKey('title') ? json['title'] as String? ?? 'No title' : 'No title',
      description: json.containsKey('description') ? json['description'] as String? ?? 'No description' : 'No description',
      author: json.containsKey('author') ? json['author'] as String? ?? 'Unknown' : 'Unknown',
      url: json.containsKey('url') ? json['url'] as String? ?? 'No URL' : 'No URL',
      urlToImage: json.containsKey('urlToImage') ? json['urlToImage'] as String? : null,
      publishedAt: json.containsKey('publishedAt') 
          ? DateTime.tryParse(json['publishedAt'] as String? ?? '') ?? DateTime(1970, 1, 1) 
          : DateTime(1970, 1, 1),
    );
  }
}
