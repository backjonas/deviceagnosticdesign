import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataProvider = StateProvider<List<String>>((ref) => []);

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
          home: Scaffold(
              body: Center(
                  child: Column(children: [
    AddWidget(),
    ListWidget(),
  ]))))));
}

class AddWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
        onPressed: () => ref
            .watch(dataProvider.notifier)
            .update((state) => [...state, 'Yes']),
        child: const Text('Yes'),
      ),
      ElevatedButton(
        onPressed: () => ref
            .watch(dataProvider.notifier)
            .update((state) => [...state, 'No']),
        child: const Text('No'),
      ),
    ]);
  }
}

class ListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> data = ref.watch(dataProvider);
    return Column(children: data.map((e) => Text(e)).toList());
  }
}
