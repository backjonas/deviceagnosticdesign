import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './screens/home_screen.dart';
import './screens/welcome_screen.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);

main() {
  runApp(MaterialApp.router(routerConfig: routes));
}
