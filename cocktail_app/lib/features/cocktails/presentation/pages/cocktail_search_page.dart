import 'package:cocktail_app/core/resource.dart';
import 'package:cocktail_app/features/cocktails/data/remote/cocktai_service.dart';
import 'package:cocktail_app/features/cocktails/domain/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:cocktail_app/features/cocktails/presentation/widgets/cocktail_list.dart';

class CocktailSearchPage extends StatefulWidget {
  const CocktailSearchPage({super.key});

  @override
  State<CocktailSearchPage> createState() => _CocktailSearchPageState();
}

class _CocktailSearchPageState extends State<CocktailSearchPage> {
  List<Cocktail> _items = [];

  Future<void> _loadData(String query) async {
    Resource<List<Cocktail>> result =
        await CocktaiService().searchCocktails(query);

    if (result is Success) {
      List<Cocktail> items = result.data!;
      setState(() {
        _items = items;
      });
    } else {
      setState(() {
        _items = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              _loadData(value);
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder()),
          ),
          Expanded(child: CocktailList(items: _items))
        ],
      ),
    );
  }
}
