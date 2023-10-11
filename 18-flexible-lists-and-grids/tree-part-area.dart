import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: Column(children: [
    SizedBox(
      child: Container(
        color: Colors.red,
      ),
      height: 40,
    ),
    Expanded(
      child: Container(
        color: Colors.green,
      ),
    ),
    SizedBox(
        child: Container(
          color: Colors.red,
        ),
        height: 40)
  ]))));
}
