import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: Column(children: [
    Row(
      children: const [
        Text("A"),
        Text("B"),
        Text("C"),
      ],
    ),
    Row(
      children: const [
        Text("D"),
        Text("E"),
      ],
    ),
    Row(
      children: const [
        Text("F"),
      ],
    ),
  ]))));
}
