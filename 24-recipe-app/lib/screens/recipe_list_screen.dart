import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/category_with_recipes.dart';
import 'package:recipe_app/layout/screen_wrapper.dart';

class RecipeListScreen extends StatelessWidget {
  final String categoryId;
  const RecipeListScreen(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      Center(child: CategoryWithRecipesWidget(categoryId)),
    );
  }
}
