import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final correctCountProvider = StateProvider<int>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  final currentValue = preferences.getInt("correct_count") ?? 0;
  ref.listenSelf((prev, curr) {
    preferences.setInt('correct_count', curr);
  });
  return currentValue;
});
