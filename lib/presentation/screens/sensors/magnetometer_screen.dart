import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../lib_barrel.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnetometer$ = ref.watch(magnetometerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Magnetómetro')),
      body: Center(
        child: magnetometer$.when(
          data:
              (value) =>
                  Text(value.toString(), style: const TextStyle(fontSize: 30)),
          error: (Object error, StackTrace stackTrace) => Text('$error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
