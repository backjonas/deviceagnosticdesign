import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/search_result.dart';
import 'package:recipe_app/layout/screen_wrapper.dart';

class SearchScreen extends StatelessWidget {
  final String query;
  const SearchScreen(this.query);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      Center(child: SearchResultWidget(query)),
    );
  }
}
