import 'dart:convert';
import 'package:flutter/material.dart';

import 'model.dart';

class HomeScreen extends StatelessWidget {
  final String jsonData = '''
  {
    "recipes": [
      {"title": "Pasta Carbonara", "description": "Creamy pasta dish..."},
      {"title": "Caprese Salad", "description": "Simple and refreshing..."},
      {"title": "Banana Smoothie", "description": "Healthy and creamy..."},
      {"title": "Chicken Stir-Fry", "description": "Quick and flavorful..."},
      {"title": "Grilled Salmon", "description": "Delicious grilled..."},
      {"title": "Vegetable Curry", "description": "Spicy and aromatic..."},
      {"title": "Berry Parfait", "description": "Layered dessert..."}
    ]
  }
  ''';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> decodedData = jsonDecode(jsonData);
    final List<dynamic> recipeList = decodedData['recipes'];

    // Model to list
    List<Recipe> recipes = recipeList.map((item) => Recipe.fromJson(item)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Recipe List")),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: Text(recipes[index].title),
            subtitle: Text(recipes[index].description),
          );
        },
      ),
    );
  }
}