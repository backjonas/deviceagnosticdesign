import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

class RecipeListWidget extends StatelessWidget {
  final List<Recipe> recipes;
  const RecipeListWidget(this.recipes);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: recipes.map((recipe) => RecipeCardWidget(recipe)).toList(),
    );
  }
}
