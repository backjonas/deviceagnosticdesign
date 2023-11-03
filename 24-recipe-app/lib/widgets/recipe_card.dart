import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;
  const RecipeCardWidget(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          child: Text(recipe.name),
          onPressed: () => context.go('/recipe/${recipe.id}'),
        ));
  }
}
