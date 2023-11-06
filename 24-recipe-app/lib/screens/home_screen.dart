import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/layout/screen_wrapper.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/services/category_api.dart';
import 'package:recipe_app/services/recipe_api.dart';
import 'package:recipe_app/widgets/category_card.dart';
import 'package:recipe_app/widgets/recipe_card.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(Center(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const TitleWidget(
            "Featured recipe",
          ),
          FutureBuilder<List<Recipe>>(
              future: RecipeApi().findAllRecipes(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading recipes");
                } else if (snapshot.hasError) {
                  return const Text("Error retrieving recipes");
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("Recipe not found");
                }
                return RecipeCardWidget(snapshot.data![0]);
              }),
          const TitleWidget(
            "Featured categories",
          ),
          FutureBuilder<List<Category>>(
              future: CategoryApi().findCategorySubset(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Category>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading categories");
                } else if (snapshot.hasError) {
                  return const Text("Error retrieving categories");
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("Category not found");
                }
                return Column(
                  children: snapshot.data!
                      .map((category) => CategoryCardWidget(category))
                      .toList(),
                );
              }),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextButton(
                child: Text("View all categories"),
                onPressed: () => context.go('/category')),
          )
        ],
      ),
    ));
  }
}
