import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: const Text(
          style: TextStyle(fontSize: 36),
          "Featured recipes",
        ));
  }
}
