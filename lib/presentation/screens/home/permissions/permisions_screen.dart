import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers_barrel.dart';

class PermisionsScreen extends StatelessWidget {
  const PermisionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permisos')),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissions = ref.watch(permissionsProvider);
    return ListView(
      children: [
        CheckboxListTile(
          value: permissions.cameraGranted,
          title: const Text('Cámara'),
          subtitle: Text('${permissions.camera}'),
          onChanged: (_) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.photoLibraryGranted,
          title: const Text('Galería'),
          subtitle: Text('${permissions.photoLibrary}'),
          onChanged: (_) {
            ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.sensorsGranted,
          title: const Text('Sensores'),
          subtitle: Text('${permissions.sensors}'),
          onChanged: (_) {
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.locationGranted,
          title: const Text('Localización'),
          subtitle: Text('${permissions.location}'),
          onChanged: (_) {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.locationAlwaysGranted,
          title: const Text('Localización siempre'),
          subtitle: Text('${permissions.locationAlways}'),
          onChanged: (_) {
            ref
                .read(permissionsProvider.notifier)
                .requestLocationAlwaysAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.locationWhenInUseGranted,
          title: const Text('Localización cuando se usa '),
          subtitle: Text('${permissions.locationWhenInUse}'),
          onChanged: (_) {
            ref
                .read(permissionsProvider.notifier)
                .requestLocationWhenInUseAccess();
          },
        ),
      ],
    );
  }
}
