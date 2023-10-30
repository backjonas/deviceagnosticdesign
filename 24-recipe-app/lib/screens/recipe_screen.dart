import 'package:flutter/material.dart';
import '../layout/screen_wrapper.dart';

class RecipeScreen extends StatelessWidget {
  final int recipeId;
  const RecipeScreen(this.recipeId);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      Center(child: Text("RecipeScreen, recipe: $recipeId")),
    );
  }
}
