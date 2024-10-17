class News {
  String author;
  String title;
  String description;
  String content;
  String url;
  String urlToImage;
  String publishedAt;

  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.content,
      required this.url,
      required this.urlToImage,
      required this.publishedAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        content: json['content'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ?? 'https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png',
        publishedAt: json['publishedAt'] ?? '');
  }
}
