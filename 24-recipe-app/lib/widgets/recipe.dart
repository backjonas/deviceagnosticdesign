import 'package:flutter/material.dart';
import 'package:recipe_app/services/recipe_api.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeWidget extends StatelessWidget {
  final String recipeId;
  const RecipeWidget(this.recipeId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
        future: RecipeApi().findRecipeById(recipeId),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading recipe");
          } else if (snapshot.hasError) {
            return const Text("Error retrieving recipe");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("Recipe not found");
          } else {
            final recipe = snapshot.data![0];
            return Column(children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  style: TextStyle(fontSize: 36),
                  recipe.name,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Placeholder(),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                child: const Text(
                  style: TextStyle(fontSize: 18),
                  "Ingredients",
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(recipe.ingredients),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                child: const Text(
                  style: TextStyle(fontSize: 18),
                  "Steps",
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(recipe.steps),
              ),
            ]);
          }
        });
  }
}
