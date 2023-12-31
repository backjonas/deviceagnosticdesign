import 'package:flutter/material.dart';
import './screen_wrapper.dart';
import '../widgets/topic_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return const ScreenWrapper(
      Center(child: TopicList()),
    );
  }
}
