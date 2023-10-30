import 'package:flutter/material.dart';
import '../layout/screen_wrapper.dart';

class RecipeListScreen extends StatelessWidget {
  final int categoryId;
  const RecipeListScreen(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      Center(child: Text("RecipeListScreen, category: $categoryId")),
    );
  }
}
