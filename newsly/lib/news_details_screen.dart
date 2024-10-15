import 'package:flutter/material.dart';
import 'package:newsly/news.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key, required this.news});
  final News news;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.news.title,
              child: Image.network(
                widget.news.urlToImage,
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
                widget.news.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Text(widget.news.author),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.news.content),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.outlined(
                    onPressed: () {}, icon: const Icon(Icons.web)),
                IconButton.outlined(
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: _isFavorite
                          ? ThemeData().primaryColor
                          : ThemeData().hintColor,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
