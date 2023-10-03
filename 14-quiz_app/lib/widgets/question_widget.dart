import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../api/quiz_api.dart';
import '../models/question.dart';
import '../providers/correct_count.dart';

final resultProvider = StateProvider<bool?>((ref) => null);

class QuestionWidget extends ConsumerWidget {
  final int topicId;
  const QuestionWidget(this.topicId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Question>(
        future: QuizApi().findQuestion(topicId),
        builder: (BuildContext context, AsyncSnapshot<Question> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading question");
          } else if (snapshot.hasError) {
            return const Text("Error retrieving question");
          } else if (!snapshot.hasData) {
            return const Text("Question not found");
          } else {
            final question = snapshot.data!;
            return Column(children: [
              Text(question.question),
              OptionList(question.options, question.answerPostPath),
              ResponseWidget(topicId)
            ]);
          }
        });
  }
}

class ResponseWidget extends ConsumerWidget {
  final int topicId;
  const ResponseWidget(this.topicId);

  _nextQuestion(BuildContext context, WidgetRef ref) {
    ref.watch(resultProvider.notifier).update((state) => null);
    context.go('/question/${topicId}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool? answerResult = ref.watch(resultProvider);
    return answerResult != null
        ? Column(children: [
            answerResult
                ? Column(
                    children: [
                      Text('The answer was correct'),
                      ElevatedButton(
                          child: Text('Next question'),
                          onPressed: () => _nextQuestion(context, ref)),
                    ],
                  )
                : Text('The answer was incorrect'),
          ])
        : const Text('');
  }
}

class OptionList extends ConsumerWidget {
  final List<String> options;
  final String answerPostPath;
  const OptionList(this.options, this.answerPostPath);

  _answerQuestion(String answer, String answerPath, WidgetRef ref) async {
    final result = await QuizApi().getResult(answer, answerPath);
    ref.watch(resultProvider.notifier).update((state) => result);

    if (result) {
      ref.read(correctCountProvider.notifier).state += 1;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool? answerResult = ref.watch(resultProvider);

    return answerResult != true
        ? Column(children: [
            ...options.map((option) => ElevatedButton(
                  child: Text(option),
                  onPressed: () => _answerQuestion(option, answerPostPath, ref),
                )),
          ])
        : Text('');
  }
}
