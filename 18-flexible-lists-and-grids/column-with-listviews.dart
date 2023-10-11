import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: HomeScreen())));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 200,
          child: ListView(children: const [
            Card(child: ListTile(title: Text('Hello'))),
            Card(child: ListTile(title: Text('column!'))),
          ])),
      Container(
          height: 200,
          child: ListView(children: const [
            Card(child: ListTile(title: Text('and others.'))),
          ]))
    ]);
  }
}
