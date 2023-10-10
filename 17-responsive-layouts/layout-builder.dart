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
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < Breakpoints.sm) {
        return MobileLayout();
      } else if (constraints.maxWidth < Breakpoints.md) {
        return TabletLayout();
      } else {
        return DesktopLayout();
      }
    });
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
