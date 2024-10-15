import 'package:flutter/material.dart';
import 'package:newsly/news.dart';
import 'package:newsly/news_details_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailsScreen(news: news),
            ));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: news.title,
              child: Image.network(
                news.urlToImage,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 150,
                    child: Center(child: Text('No image found')),
                  );
                },
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              news.title,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(news.author),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                news.description,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
