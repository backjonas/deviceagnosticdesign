import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../api/quiz_api.dart';
import '../models/question.dart';

class QuestionWidget extends StatelessWidget {
  final int topicId;
  const QuestionWidget(this.topicId);

  _answerQuestion(String answer, String answerPath) async {
    print('Answer: $answer, answerPath: $answerPath');
  }

  @override
  Widget build(BuildContext context) {
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
                        _answerQuestion(option, question.answerPostPath),
                  ))
            ]);
          }
        });
  }
}
