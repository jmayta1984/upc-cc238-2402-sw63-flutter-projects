import 'package:cocktail_app/features/cocktails/domain/cocktail.dart';
import 'package:cocktail_app/features/cocktails/presentation/pages/cocktail_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cocktail_app/features/cocktails/presentation/widgets/cocktail_list_item.dart';


class CocktailList extends StatelessWidget {
  const CocktailList({super.key, required this.items});
  final List<Cocktail> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => CocktailDetailPage(item: items[index]),));
        },
        child: CocktailListItem(item: items[index])),
    );
  }
}
