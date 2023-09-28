import 'package:test/test.dart';

import '../lib/jokes/jokes.dart';

void main() {
  test('JokeRepository.randomJoke returns a Joke', () async {
    expect(JokeRepository.randomJoke(), isA<Joke>());
  });
  test(
      "JokeRepository.randomJoke does not return the question What's orange and sounds like a parrot?",
      () async {
    expect(
        JokeRepository.randomJoke().question !=
            "What's orange and sounds like a parrot?",
        true);
  });
}
