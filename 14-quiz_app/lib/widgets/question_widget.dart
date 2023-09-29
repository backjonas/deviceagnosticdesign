import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../api/quiz_api.dart';
import '../models/question.dart';

final resultProvider = StateProvider<bool?>((ref) => null);

class QuestionWidget extends ConsumerWidget {
  final int topicId;
  const QuestionWidget(this.topicId);

  _answerQuestion(String answer, String answerPath, WidgetRef ref) async {
    final result = await QuizApi().getResult(answer, answerPath);
    ref.watch(resultProvider.notifier).update((state) => result);
    if (result) {
      // Increase correct answer count (SharedPreference)
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Question>(
        future: QuizApi().findQuestion(topicId),
        builder: (BuildContext context, AsyncSnapshot<Question> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading topics");
          } else if (snapshot.hasError) {
            return const Text("Error retrieving topics");
          } else if (!snapshot.hasData) {
            return const Text("Question not found");
          } else {
            final question = snapshot.data!;
            return Column(children: [
              Text(question.question),
              ...question.options.map((option) => ElevatedButton(
                    child: Text(option),
                    onPressed: () =>
                        _answerQuestion(option, question.answerPostPath, ref),
                  )),
              ResponseWidget(topicId)
            ]);
          }
        });
  }
}

class ResponseWidget extends ConsumerWidget {
  final int topicId;
  const ResponseWidget(this.topicId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool? answerResult = ref.watch(resultProvider);
    return answerResult != null
        ? Column(children: [
            Text(answerResult
                ? 'The answer was correct'
                : 'The answer was incorrect'),
            ElevatedButton(
              child: Text('Next question'),
              onPressed: () => context.go('/question/${topicId}'),
            ),
          ])
        : const Text('');
  }
}
