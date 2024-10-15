import 'package:flutter/material.dart';
import 'package:newsly/news.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: news.title,
              child: Image.network(
                news.urlToImage,
                height: height * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text('No image found'),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                news.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Text(news.author),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(news.content),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.outlined(
                    onPressed: () {}, icon: const Icon(Icons.web)),
                IconButton.outlined(
                    onPressed: () {}, icon: const Icon(Icons.favorite)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
