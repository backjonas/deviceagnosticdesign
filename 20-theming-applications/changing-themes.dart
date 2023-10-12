import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<int>((ref) => 0);
final themeList = [
  ThemeData.light(),
  ThemeData.dark(),
  ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
  ),
];
void main() {
  runApp(ProviderScope(child: MyApplication()));
}

class MyApplication extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: themeList[ref.watch(themeProvider)],
      home: Scaffold(
        appBar: AppBar(title: const Text("Swapiti swap swap")),
        body: Center(
            child: ElevatedButton(
          onPressed: () => ref
              .watch(themeProvider.notifier)
              .update((state) => (state + 1) % 3),
          child: Text("Change theme"),
        )),
      ),
    );
  }
}
