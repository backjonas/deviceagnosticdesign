import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rateProvider = StateProvider<double>((ref) => 0.0);

Future<void> main() async {
  runApp(ProviderScope(
      child: MaterialApp(home: Scaffold(body: Center(child: RateWidget())))));
}

class RateWidget extends ConsumerWidget {
  _updateRate(WidgetRef ref, String from, String to) async {
    double rate = await RateService().getRate(from, to);
    ref.watch(rateProvider.notifier).update((state) => rate);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double rate = ref.watch(rateProvider);
    return Column(children: [
      Row(
        children: [
          ElevatedButton(
            onPressed: () => _updateRate(ref, "EUR", "USD"),
            child: const Text('100 EUR in USD'),
          ),
          ElevatedButton(
            onPressed: () => _updateRate(ref, "EUR", "SEK"),
            child: const Text('100 EUR in SEK'),
          ),
        ],
      ),
      Text(rate == 0.0 ? "Press to retrieve" : "$rate")
    ]);
  }
}

class RateService {
  final _baseUrl = 'api.frankfurter.app';

  Future<double> getRate(String from, String to) async {
    final queryParameters = {"from": from, "to": to};
    final endpoint = Uri.https(_baseUrl, "/latest", queryParameters);
    final response = await http.get(endpoint);
    final data = jsonDecode(response.body);
    return 100.0 * data['rates'][to];
  }
}
