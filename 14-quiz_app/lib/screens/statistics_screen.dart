import 'package:flutter/material.dart';
import './screen_wrapper.dart';
import '../widgets/statistics_widget.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      Center(
        child: StatisticsWidget(),
      ),
    );
  }
}
