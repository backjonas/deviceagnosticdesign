import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            return Column(children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(snapshot.data![0].name),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(snapshot.data![0].picture),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Text("Ingredients"),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(snapshot.data![0].ingredients),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Text("Steps"),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(snapshot.data![0].steps),
              ),
            ]);
          }
        });
  }
}
