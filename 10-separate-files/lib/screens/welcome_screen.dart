import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Text("Welcome!"),
              ElevatedButton(
                  onPressed: () => context.go('/home'),
                  child: const Text("Home"))
            ])));
  }
}
