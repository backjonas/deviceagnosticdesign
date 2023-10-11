import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: Column(children: [
    Expanded(
      child: Container(
          color: Colors.red, child: const Text('Red'), width: double.infinity),
    ),
    Expanded(
      child: Container(
          color: Colors.yellow,
          child: const Text('Yellow'),
          width: double.infinity),
    ),
    Expanded(
      child: Container(
          color: Colors.green,
          child: const Text('Green'),
          width: double.infinity),
    )
  ]))));
}
