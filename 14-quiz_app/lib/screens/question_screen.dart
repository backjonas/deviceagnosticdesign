import 'package:flutter/material.dart';
import './screen_wrapper.dart';
import '../widgets/question_widget.dart';

class QuestionScreen extends StatelessWidget {
  final int topicId;
  const QuestionScreen(this.topicId);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      Center(child: QuestionWidget(topicId)),
    );
  }
}
