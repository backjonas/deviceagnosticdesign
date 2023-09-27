import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final likeProvider = StateProvider<int>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  final currentValue = preferences.getInt('likes') ?? 5;
  ref.listenSelf((prev, curr) {
    preferences.setInt('likes', curr);
  });
  return currentValue;
});

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

main() async {
  final prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: LikeApp(),
  ));
}

class LikeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: LikeWidget()));
  }
}

class LikeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likes = ref.watch(likeProvider);

    return Column(children: [
      Text('Likes: $likes'),
      IconButton(
        icon: const Icon(Icons.thumb_up),
        onPressed: () => ref.read(likeProvider.notifier).state = likes + 1,
      )
    ]);
  }
}
