import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

void main() {
  final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const ButtonScreen.withoutFirst()),
      GoRoute(
          path: '/:first',
          builder: (context, state) =>
              ButtonScreen(int.parse(state.pathParameters['first']!))),
      GoRoute(
          path: '/:first/:second',
          builder: (context, state) => SumScreen(
              int.parse(state.pathParameters['first']!),
              int.parse(state.pathParameters['second']!))),
    ],
  );

  runApp(MaterialApp.router(routerConfig: router));
}

class ButtonScreen extends StatelessWidget {
  final int? first;
  const ButtonScreen(this.first);
  const ButtonScreen.withoutFirst() : first = null;

  _onClick(BuildContext context, int value) {
    if (first == null) {
      context.go("/$value");
    } else {
      context.go("/$first/$value");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(children: [
      ElevatedButton(
          onPressed: () => _onClick(context, 1), child: const Text("1")),
      ElevatedButton(
          onPressed: () => _onClick(context, 2), child: const Text("2")),
      ElevatedButton(
          onPressed: () => _onClick(context, 3), child: const Text("3")),
      ElevatedButton(
          onPressed: () => _onClick(context, 4), child: const Text("4")),
      ElevatedButton(
          onPressed: () => _onClick(context, 5), child: const Text("5")),
    ])));
  }
}

class SumScreen extends StatelessWidget {
  final int _first;
  final int _second;
  const SumScreen(this._first, this._second);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      SumWidget(_first, _second),
    ])));
  }
}

class SumWidget extends StatelessWidget {
  final int _first;
  final int _second;
  const SumWidget(this._first, this._second);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: SumApi().sum(_first, _second),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading product.");
        } else if (snapshot.hasError) {
          return Text("Error retrieving product: ${snapshot.error}");
        } else if (!snapshot.hasData) {
          return const Text("No product data.");
        } else {
          int sum = snapshot.data!;
          return Column(
            children: [
              Text("$_first + $_second = $sum"),
            ],
          );
        }
      },
    );
  }
}

class SumApi {
  Future<int> sum(int first, int second) async {
    var response = await http.post(
      Uri.parse('https://fitech-api.deno.dev/sum-api'),
      body: jsonEncode({'one': first, 'two': second}),
    );

    var data = jsonDecode(response.body);
    return data['sum'];
  }
}
