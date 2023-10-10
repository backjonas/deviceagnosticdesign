import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class Breakpoints {
  static const sm = 600;
  static const md = 900;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: HomeScreen()));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width < Breakpoints.sm) {
      return MobileLayout();
    } else if (size.width < Breakpoints.md) {
      return TabletLayout();
    } else {
      return DesktopLayout();
    }
  }
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Mobile');
  }
}

class TabletLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Tablet');
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Desktop');
  }
}
