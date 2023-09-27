import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fontSizeProvider = StateProvider<double>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  final currentValue = preferences.getDouble('font_size') ?? 14.0;
  ref.listenSelf((prev, curr) {
    preferences.setDouble('font_size', curr);
  });
  return currentValue;
});

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

main() async {
  final prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: FontSizeApp(),
  ));
}

class FontSizeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: FontSizeWidget()));
  }
}

class FontSizeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = ref.watch(fontSizeProvider);
    return Column(children: [
      IconButton(
          icon: const Icon(Icons.add),
          onPressed: () =>
              ref.read(fontSizeProvider.notifier).state = fontSize + 1),
      Text('Lorem Ipsum', style: TextStyle(fontSize: fontSize)),
      IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () =>
              ref.read(fontSizeProvider.notifier).state = fontSize - 1),
    ]);
  }
}
