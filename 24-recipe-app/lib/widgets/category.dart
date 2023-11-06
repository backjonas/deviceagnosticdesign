import 'package:flutter/material.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/services/category_api.dart';
import 'package:recipe_app/widgets/recipe_list.dart';
import 'package:recipe_app/widgets/title.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryId;
  const CategoryWidget(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: CategoryApi().findCategory(categoryId),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading recipes");
          } else if (snapshot.hasError) {
            return const Text("Error retrieving recipes");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("Category not found");
          } else {
            final category = snapshot.data![0];
            return ListView(scrollDirection: Axis.vertical, children: [
              TitleWidget(category.name),
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: const Placeholder()),
              RecipeListWidget(category.recipes)
            ]);
          }
        });
  }
}
