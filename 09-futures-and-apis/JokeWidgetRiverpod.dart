import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jokeProvider = StateProvider<Joke>((ref) => Joke("", ""));
final punchlineProvider = StateProvider<bool>((ref) => false);

Future<void> main() async {
  runApp(ProviderScope(
      child: MaterialApp(home: Scaffold(body: Center(child: JokeWidget())))));
}

class JokeWidget extends ConsumerWidget {
  _updateJoke(WidgetRef ref) async {
    Joke j = await JokeService().getRandomJoke();
    ref.watch(jokeProvider.notifier).update((state) => j);
    ref.watch(punchlineProvider.notifier).update((state) => false);
  }

  _showPunchLine(WidgetRef ref) async {
    ref.watch(punchlineProvider.notifier).update((state) => true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Joke joke = ref.watch(jokeProvider);
    final bool showPunchLine = ref.watch(punchlineProvider);
    return Column(children: [
      ElevatedButton(
        onPressed: () => _updateJoke(ref),
        child: const Text('Fetch joke!'),
      ),
      joke.setup == ""
          ? const Text("Click the button..")
          : Column(children: [
              Text(joke.setup),
              showPunchLine
                  ? Text(joke.punchline)
                  : ElevatedButton(
                      onPressed: () => _showPunchLine(ref),
                      child: Text('Tell me')),
            ])
    ]);
  }
}

class JokeService {
  final _endpoint = Uri.parse('https://simple-joke-api.deno.dev/random');

  Future<Joke> getRandomJoke() async {
    var response = await http.get(_endpoint);
    var data = jsonDecode(response.body);

    return Joke(data['setup'], data['punchline']);
  }
}

class Joke {
  String setup;
  String punchline;
  Joke(this.setup, this.punchline);
}
