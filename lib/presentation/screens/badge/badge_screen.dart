import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/lib_barrel.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final badgeCounter = ref.watch(badgeCounterProvider);
    return Scaffold(
      appBar: AppBar(title: Text('App badge')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              alignment: Alignment.lerp(
                Alignment.topRight,
                Alignment.bottomRight,
                0.2,
              ),
              label: Text('$badgeCounter'),
              child: Text(
                '$badgeCounter',
                style: const TextStyle(fontSize: 150),
              ),
            ),

            FilledButton.tonal(
              onPressed: () {
                ref.invalidate(badgeCounterProvider);
              },
              child: Text('Borrar badge'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newValue = ref
              .read(badgeCounterProvider.notifier)
              .update((state) => state + 1);
          FlutterLocalNotifications.showBadgeNotification(newValue);
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
