import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/question_screen.dart';
import 'screens/statistics_screen.dart';
import 'providers/correct_count.dart';

main() async {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
          path: '/question/:topicId',
          builder: (context, state) =>
              QuestionScreen(int.parse(state.pathParameters['topicId']!))),
      GoRoute(path: '/stats', builder: (context, state) => StatisticsScreen())
    ],
  );

  final prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: MaterialApp.router(routerConfig: router)));
}
