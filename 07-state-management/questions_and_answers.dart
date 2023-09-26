import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionProvider = StateProvider<int>((ref) => 0);
final correctProvider = StateProvider<int>((ref) => 0);

main() {
  runApp(ProviderScope(
      child:
          MaterialApp(home: Scaffold(body: Center(child: QuestionWidget())))));
}

class QuestionWidget extends ConsumerWidget {
  void _incrementQuestion(WidgetRef ref) {
    ref
        .watch(questionProvider.notifier)
        .update((state) => state == 3 ? state : state + 1);
  }

  void _incrementCorrect(WidgetRef ref) {
    ref
        .watch(questionProvider.notifier)
        .update((state) => state == 3 ? state : state + 1);

    ref.watch(correctProvider.notifier).update(
        (state) => ref.watch(questionProvider) == 3 ? state : state + 1);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int questionCount = ref.watch(questionProvider);
    final int correctCount = ref.watch(correctProvider);
    final List<String> questions = ['Is 2+2 4?', 'Is 1+2 3?', 'Is 1-1 0?'];

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text("Questions asked: $questionCount"),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text("Correct answers: $correctCount"),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text(questionCount > 2 ? "All done" : questions[questionCount]),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ElevatedButton(
          onPressed: () => _incrementCorrect(ref),
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () => _incrementQuestion(ref),
          child: const Text('No'),
        ),
      ])
    ]);
  }
}
