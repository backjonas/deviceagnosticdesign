import 'package:flutter/material.dart';
import 'package:recipe_app/layout/screen_wrapper.dart';
import 'package:recipe_app/widgets/recipe_widget.dart';

class RecipeScreen extends StatelessWidget {
  final String recipeId;
  const RecipeScreen(this.recipeId);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      Center(child: RecipeWidget(recipeId)),
    );
  }
}
