import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = StateProvider<String>((ref) => '');

main() {
  runApp(ProviderScope(child: FormApp()));
}

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(children: [
      TextFieldForm(),
      ItemWidget(),
    ])));
  }
}

class TextFieldForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (String value) =>
          ref.watch(nameProvider.notifier).update((state) => value),
      decoration: const InputDecoration(
        hintText: 'Filter',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ItemWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        children: ItemService()
            .getItems()
            .where((item) => item.contains(ref.watch(nameProvider)))
            .map((e) => Text(e))
            .toList());
  }
}

class ItemService {
  List<String> getItems() {
    return [
      'Mini hand squirrel',
      'Cheeseburger telephone',
      'Bacon-scented soap',
      'Thumb piano'
    ];
  }
}
