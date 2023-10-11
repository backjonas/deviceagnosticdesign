import 'package:flutter/material.dart';

main() {
  const salads = SizedBox(
      width: 200,
      child: Card(
          child: ListTile(
        leading: Icon(Icons.favorite),
        title: Text("Salads"),
        subtitle: Text("Best salads ever"),
      )));

  const hamburgers = SizedBox(
      width: 250,
      child: Card(
          child: ListTile(
        leading: Icon(Icons.favorite),
        title: Text("Hamburgers"),
        subtitle: Text("Best hamburgers ever"),
      )));

  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: const Text('My Application')),
    body: Column(children: [
      SizedBox(
          height: 100,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [hamburgers, salads])),
      Expanded(child: Container(color: Colors.green)),
      Container(
          color: Colors.red,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [Text('A'), Text('B'), Text('C')],
          ))
    ]),
  )));
}
