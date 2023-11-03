import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({super.key});

  @override
  State<SearchFieldWidget> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchFieldWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0)),
      leading: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () => context.go("/search/${_controller.text}"),
      ),
    );
  }
}
