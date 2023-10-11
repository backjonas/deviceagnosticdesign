import 'package:flutter/material.dart';

main() {
  final songs = [
    const Card(
        child: ListTile(
      title: Text("Imagine"),
      subtitle: Text("John Lennon - 1971"),
    )),
    const Card(
        child: ListTile(
      title: Text("Yesterday"),
      subtitle: Text("The Beatles - 1965"),
    )),
    const Card(
        child: ListTile(
      title: Text("Johnny B. Goode"),
      subtitle: Text("Chuck Berry - 1958"),
    )),
  ];

  runApp(MaterialApp(home: Scaffold(body: Column(children: songs))));
}
