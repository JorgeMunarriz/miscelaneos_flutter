import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/lib_barrel.dart';

class AskLocationPermissionScreen extends ConsumerWidget {
  const AskLocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Permiso requerido')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
          child: const Text('Localización necesaria'),
        ),
      ),
    );
  }
}
