import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
        path: '/x/:x/y/:y',
        builder: (context, state) => CoordinateScreen(
            int.parse(state.pathParameters['x']!),
            int.parse(state.pathParameters['y']!))),
  ],
);

main() {
  runApp(MaterialApp.router(routerConfig: router));
}

class HomeScreen extends CoordinateScreen {
  HomeScreen() : super(0, 0);
}

class CoordinateScreen extends StatelessWidget {
  final int x;
  final int y;

  const CoordinateScreen(this.x, this.y);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Text("You are at ($x, $y)"),
      ElevatedButton(
        onPressed: () => context.go("/x/$x/y/${y + 1}"),
        child: const Text("Up"),
      ),
      ElevatedButton(
        onPressed: () => context.go("/x/$x/y/${y - 1}"),
        child: const Text("Down"),
      ),
      ElevatedButton(
        onPressed: () => context.go("/x/${x - 1}/y/$y"),
        child: const Text("Left"),
      ),
      ElevatedButton(
        onPressed: () => context.go("/x/${x + 1}/y/$y"),
        child: const Text("Right"),
      ),
    ])));
  }
}
