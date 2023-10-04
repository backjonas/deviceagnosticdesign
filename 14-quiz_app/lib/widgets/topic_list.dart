import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/quiz_api.dart';
import '../models/topic.dart';

class TopicList extends StatelessWidget {
  const TopicList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: QuizApi().findAllTopics(),
        builder: (BuildContext context, AsyncSnapshot<List<Topic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading topics");
          } else if (snapshot.hasError) {
            return const Text("Error retrieving topics");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("No topics available");
          } else {
            return Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Text('Select a topic to begin answering questions')),
              ...snapshot.data!.map((topic) => Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    child: Text(topic.name),
                    onPressed: () => context.go('/question/${topic.id}'),
                  )))
            ]);
          }
        });
  }
}
