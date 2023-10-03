import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget widget;
  const ScreenWrapper(this.widget);

  _goTo(BuildContext context, String route) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.home), onPressed: () => context.go('/')),
          title: const Center(child: Text("Quiz app")),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                  icon: const Icon(Icons.auto_graph),
                  onPressed: () => context.go('/stats')),
            ),
          ]),
      body: widget,
    );
  }
}
