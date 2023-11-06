import 'package:flutter/material.dart';
import 'package:recipe_app/services/recipe_api.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/title.dart';

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
            return ListView(scrollDirection: Axis.vertical, children: [
              TitleWidget(recipe.name),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: const Placeholder(),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                child: const Text(
                  style: TextStyle(fontSize: 18),
                  "Ingredients",
                ),
              ),
              Column(
                  children: recipe.ingredients
                      .map((ingredient) => Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text("\u2022 $ingredient"),
                          ))
                      .toList()),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                child: const Text(
                  style: TextStyle(fontSize: 18),
                  "Steps",
                ),
              ),
              Column(
                  children: recipe.steps
                      .map((step) => Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text("\u2022 $step"),
                          ))
                      .toList()),
            ]);
          }
        });
  }
}
