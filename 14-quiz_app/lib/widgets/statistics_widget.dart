import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/correct_count.dart';

class StatisticsWidget extends ConsumerWidget {
  const StatisticsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
        'Number of correct answers: ${ref.watch(correctCountProvider)}');
  }
}
