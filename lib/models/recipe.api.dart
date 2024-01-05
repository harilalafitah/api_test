import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app_with_api/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": "18", "start": "0"});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'b005a79c0dmshab93c417e66befcp126951jsn483a930fd5c4',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
