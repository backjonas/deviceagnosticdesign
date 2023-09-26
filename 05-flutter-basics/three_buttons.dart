import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: Row(children: [
    ElevatedButton(child: const Text("Hello"), onPressed: () => print("Hello")),
    OutlinedButton(child: const Text("world"), onPressed: () => print("world")),
    TextButton(child: const Text("!"), onPressed: () => print("!")),
  ]))));
}
