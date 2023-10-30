import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Item {
  final String name;
  int value;
  bool doubleTapped;

  Item({required this.name, required this.value, this.doubleTapped = false});

  increaseValue() {
    value += 1;
  }

  setDoubleTapped() {
    doubleTapped = true;
  }
}

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  addItem(Item item) {
    state = [item, ...state];
  }

  incrementValue(Item item) {
    item.value++;
    state = [...state];
  }

  updateColor(Item item) {
    item.doubleTapped = true;
    state = [...state];
  }
}

final itemProvider =
    StateNotifierProvider<ItemNotifier, List<Item>>((ref) => ItemNotifier());

void main() {
  runApp(ProviderScope(child: ItemApp()));
}

class ItemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(body: Column(children: [ItemForm(), ItemList()])));
  }
}

class ItemForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends ConsumerState<ItemForm> {
  final _itemNameController = TextEditingController();

  _addItem() {
    ref
        .watch(itemProvider.notifier)
        .addItem(Item(name: _itemNameController.text, value: 0));
    _itemNameController.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: _itemNameController,
        decoration: const InputDecoration(
            hintText: 'Item name', border: OutlineInputBorder()),
      ),
      ElevatedButton(onPressed: _addItem, child: const Text('Add item')),
    ]);
  }
}

class ItemList extends ConsumerWidget {
  _tapped(WidgetRef ref, Item item) {
    ref.read(itemProvider.notifier).incrementValue(item);
  }

  _doubleTap(WidgetRef ref, Item item) {
    ref.read(itemProvider.notifier).updateColor(item);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);
    return Expanded(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Dismissible(
                key: ValueKey(item),
                onDismissed: (direction) {
                  items.removeAt(index);
                },
                direction: DismissDirection.endToStart,
                child: GestureDetector(
                    onTap: () => _tapped(ref, item),
                    onDoubleTap: () => _doubleTap(ref, item),
                    child: Card(
                      color:
                          item.doubleTapped ? Colors.lightBlue : Colors.white,
                      child: ListTile(
                        title: Text(item.name),
                        subtitle: Text('Value: ${item.value}'),
                      ),
                    )),
              );
            }));
  }
}
