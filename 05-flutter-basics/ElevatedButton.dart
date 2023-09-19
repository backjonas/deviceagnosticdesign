import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  child: const Text("Click me"),
                  onPressed: () => print("Hello!"))))));
}
