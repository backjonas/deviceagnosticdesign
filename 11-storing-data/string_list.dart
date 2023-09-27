import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final listProvider = StateProvider<List<String>>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  final currentValue = preferences.getStringList("data") ?? [];
  ref.listenSelf((prev, curr) {
    preferences.setStringList("data", curr);
  });
  return currentValue;
});

main() async {
  final prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: ListApp(),
  ));
}

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: ListWidget()));
  }
}

class ListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider);
    print(list);
    return Column(children: [
      ElevatedButton(
          child: Text('Items: ${list.length}'),
          onPressed: () => ref.read(listProvider.notifier).state = [
                ...list,
                "${list.length + 1}"
              ]),
      ...list.map((e) => Text(e)),
    ]);
  }
}
