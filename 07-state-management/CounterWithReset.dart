import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Center(child: CounterWidget()))));
}

class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() => _CountState();
}

class _CountState extends State<CounterWidget> {
  int _count = 0;

  void _increment() {
    setState(() => _count++);
  }

  void _decrease() {
    setState(() => _count--);
  }

  void _reset() {
    setState(() => _count = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Current count: $_count"),
      Row(
        children: [
          ElevatedButton(
            onPressed: _decrease,
            child: Text('--'),
          ),
          ElevatedButton(
            onPressed: _reset,
            child: Text('Reset'),
          ),
          ElevatedButton(
            onPressed: _increment,
            child: Text('++'),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      )
    ]);
  }
}
