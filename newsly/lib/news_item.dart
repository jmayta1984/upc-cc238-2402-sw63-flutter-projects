import 'package:flutter/material.dart';
import 'package:newsly/news.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(news.urlToImage),
          Text(news.title),
          Text(news.author)
        ],
      ),
    );
  }
}