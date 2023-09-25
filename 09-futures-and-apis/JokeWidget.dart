import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MaterialApp(home: Scaffold(body: JokeDisplayer())));
}

class JokeDisplayer extends StatefulWidget {
  @override
  State<JokeDisplayer> createState() => _JokeDisplayerState();
}

class _JokeDisplayerState extends State<JokeDisplayer> {
  Future<Joke>? _joke;
  bool showPunchline = false;

  getJoke() {
    setState(() {
      showPunchline = false;
      _joke = JokeService().getRandomJoke();
    });
  }

  setShowPunchline() {
    setState(() {
      showPunchline = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(onPressed: getJoke, child: const Text('Fetch joke!')),
      FutureBuilder<Joke>(
        future: _joke,
        builder: (BuildContext context, AsyncSnapshot<Joke> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Waiting for a joke.");
          } else if (snapshot.hasError) {
            return Text("Error in retrieving joke: ${snapshot.error}");
          } else if (!snapshot.hasData) {
            return const Text("No jokes yet.");
          } else {
            Joke joke = snapshot.data!;
            return Column(children: [
              Text(joke.setup),
              ElevatedButton(
                  onPressed: setShowPunchline, child: const Text('Tell me')),
              Text(showPunchline ? joke.punchline : ''),
            ]);
          }
        },
      ),
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
