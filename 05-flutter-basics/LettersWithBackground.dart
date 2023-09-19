import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: Row(children: [
      Container(
          color: Colors.red, child: Text("A"), padding: EdgeInsets.all(20)),
      Container(
          color: Colors.green, child: Text("B"), padding: EdgeInsets.all(20)),
      Container(
          color: Colors.blue, child: Text("C"), padding: EdgeInsets.all(20)),
    ]),
  )));
}
