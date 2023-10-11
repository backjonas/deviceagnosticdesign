import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: GridScreen())));
}

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GridView.count(
              crossAxisCount: 1,
              children:
                  List.generate(2, (index) => const Center(child: Text('A')))),
        ),
        Expanded(
          child: GridView.count(
              crossAxisCount: 1,
              children:
                  List.generate(3, (index) => const Center(child: Text('B')))),
        ),
        Expanded(
          child: GridView.count(
              crossAxisCount: 1,
              children:
                  List.generate(4, (index) => const Center(child: Text('C')))),
        ),
      ],
    );
  }
}
