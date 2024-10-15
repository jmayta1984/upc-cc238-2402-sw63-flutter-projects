import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Utils {
  Future<dynamic> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Future<dynamic> loadJsonFromApi(String query) async {
    String baseUrl = 'https://dev.formandocodigo.com/articles.php?description=$query';
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == HttpStatus.ok) {
      return jsonDecode(response.body);
    }
  }
}
