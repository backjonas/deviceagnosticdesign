import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider<int>((ref) => 0);

main() {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/edit', builder: (context, state) => EditScreen()),
    ],
  );

  runApp(ProviderScope(child: MaterialApp.router(routerConfig: router)));
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen();

  _navigateTo(int screenId, WidgetRef ref, BuildContext ctx) {
    ref.watch(countProvider.notifier).update((state) => state + 1);
    ctx.go('/screens/$screenId');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);

    return Scaffold(
        body: Center(
            child: Column(children: [
      Text("$count"),
      ElevatedButton(
          onPressed: () => context.go('/edit'), child: const Text("Edit")),
    ])));
  }
}

class EditScreen extends ConsumerWidget {
  const EditScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      ElevatedButton(
          onPressed: () =>
              ref.watch(countProvider.notifier).update((state) => state + 1),
          child: const Text("Add")),
      ElevatedButton(
          onPressed: () => context.go('/'), child: const Text("Back")),
    ])));
  }
}
