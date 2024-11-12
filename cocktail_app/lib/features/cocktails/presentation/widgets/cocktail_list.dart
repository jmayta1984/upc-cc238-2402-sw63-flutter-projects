import 'package:cocktail_app/features/cocktails/domain/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailList extends StatelessWidget {
  const CocktailList({super.key, required this.items});
  final List<Cocktail> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => Text(items[index].name),
    );
  }
}
