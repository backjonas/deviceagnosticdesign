import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'screens/question_screen.dart';
import 'screens/statistics_screen.dart';

final countProvider = StateProvider<int>((ref) => 0);

main() {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/question', builder: (context, state) => QuestionScreen()),
      GoRoute(path: '/stats', builder: (context, state) => StatisticsScreen())
    ],
  );

  runApp(ProviderScope(child: MaterialApp.router(routerConfig: router)));
}
