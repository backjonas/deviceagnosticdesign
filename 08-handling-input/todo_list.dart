import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final String item;

  Todo({required this.item});
}

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  addTodo(Todo todo) {
    state = [todo, ...state];
  }
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());

void main() {
  runApp(ProviderScope(child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(body: Column(children: [TodoForm(), TodoList()])));
  }
}

class TodoForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends ConsumerState<TodoForm> {
  final _todoItemController = TextEditingController();

  _addTodo() {
    ref
        .watch(todoProvider.notifier)
        .addTodo(Todo(item: _todoItemController.text));
    _todoItemController.clear();
  }

  @override
  void dispose() {
    _todoItemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: _todoItemController,
        decoration: const InputDecoration(
            hintText: 'Todo name', border: OutlineInputBorder()),
      ),
      ElevatedButton(onPressed: _addTodo, child: const Text('Add todo')),
    ]);
  }
}

class TodoList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        children: ref.watch(todoProvider).map((t) => Text(t.item)).toList());
  }
}
