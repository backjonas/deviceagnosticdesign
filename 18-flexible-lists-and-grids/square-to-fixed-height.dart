import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: HomeScreen())));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 300
        ? AspectRatio(
            aspectRatio: 1,
            child: Container(margin: EdgeInsets.all(4), color: Colors.green))
        : Container(height: 300, color: Colors.green);
  }
}
