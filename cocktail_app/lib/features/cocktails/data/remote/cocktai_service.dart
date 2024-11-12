import 'dart:convert';
import 'dart:io';

import 'package:cocktail_app/core/app_constants.dart';
import 'package:cocktail_app/core/resource.dart';
import 'package:cocktail_app/features/cocktails/data/remote/cocktail_dto.dart';
import 'package:cocktail_app/features/cocktails/domain/cocktail.dart';
import 'package:http/http.dart' as http;

class CocktaiService {
  Future<Resource<List<Cocktail>>> searchCocktails(String query) async {
    String url =
        '${AppConstants.baseUrl}${AppConstants.seachPath}${AppConstants.searchQuery}$query';

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        List maps = json['drinks'];

        return Success(
            maps.map((e) => CocktailDto.fromJson(e).toCockTail()).toList());
      }
      return Error('Error: ${response.statusCode}');
    } catch (error) {
      return Error(error.toString());
    }
  }
}
