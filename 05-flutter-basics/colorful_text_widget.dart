import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: ColorfulTextWidget(color: Colors.green, text: "Apple"))));
}

class ColorfulTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  const ColorfulTextWidget({this.color = Colors.red, this.text = "Hello!"});

  @override
  Widget build(BuildContext context) {
    return Container(color: color, child: Text(text));
  }
}
