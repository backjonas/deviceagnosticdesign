import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Center(child: CounterWidget()))));
}

class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() => _CountState();
}

class _CountState extends State<CounterWidget> {
  int _color = 0;
  final colors = [Colors.blue, Colors.red];

  void _flip() {
    setState(() => _color = (_color + 1) % 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.all(20),
          color: colors[_color],
          child: ElevatedButton(
            onPressed: _flip,
            child: Text('Change'),
          ))
    ]);
  }
}
