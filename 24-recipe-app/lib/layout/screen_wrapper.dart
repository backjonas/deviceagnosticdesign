import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget widget;
  const ScreenWrapper(this.widget);

  _goTo(BuildContext context, String route) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Search"))),
      body: widget,
      bottomNavigationBar: BottomAppBar(
          child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
                icon: const Icon(Icons.home), onPressed: () => context.go('/')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
                child: Text("Categories"),
                onPressed: () => context.go('/category')),
          ),
        ],
      )),
    );
  }
}
