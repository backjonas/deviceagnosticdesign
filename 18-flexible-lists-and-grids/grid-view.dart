import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: GridScreen())));
}

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final count = width <= 300
        ? 2
        : width <= 450
            ? 3
            : 4;
    return GridView.count(
      crossAxisCount: count,
      children: List.generate(12, (index) => Center(child: Text('$index'))),
    );
  }
}
