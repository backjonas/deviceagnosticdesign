import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: Column(children: [
    Expanded(
      child: Container(color: Colors.blue),
    ),
    Expanded(
      child: Container(color: Colors.yellow),
    )
  ]))));
}
