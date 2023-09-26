import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider<int>((ref) => 0);

main() {
  runApp(ProviderScope(
      child:
          MaterialApp(home: Scaffold(body: Center(child: CounterWidget())))));
}

class CounterWidget extends ConsumerWidget {
  void _updateCount(WidgetRef ref, int change) {
    ref
        .watch(countProvider.notifier)
        .update((state) => change == 0 ? 0 : state + change);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(countProvider);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text("Current count: $count"),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
          onPressed: () => _updateCount(ref, -1),
          child: const Text('--'),
        ),
        ElevatedButton(
          onPressed: () => _updateCount(ref, 0),
          child: const Text('Reset'),
        ),
        ElevatedButton(
          onPressed: () => _updateCount(ref, 1),
          child: const Text('++'),
        ),
      ])
    ]);
  }
}
