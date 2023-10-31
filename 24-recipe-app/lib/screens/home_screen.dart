import 'package:flutter/material.dart';
import 'package:recipe_app/layout/screen_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return const ScreenWrapper(
      Center(child: Text("HomeScreen")),
    );
  }
}
