import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/local_auth/local_auth_providers.dart';

class BiometricsScreen extends ConsumerWidget {
  const BiometricsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCheckBiometrics = ref.watch(canCheckBiometricsProvider);
    final localAuthState = ref.watch(localAuthProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla biométrica ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                ref.read(localAuthProvider.notifier).authenticateUser();
              },
              child: Text('Autenticar'),
            ),
            canCheckBiometrics.when(
              data: (canCheck) => Text('Puede revisar biométricos: $canCheck'),
              error: (error, _) => Text('Error: $error'),
              loading: () => CircularProgressIndicator(),
            ),
            SizedBox(height: 40),
            const Text('Estado del biométrico', style: TextStyle(fontSize: 30, )),
            Text('Estado: ', style: TextStyle(fontSize: 20)),
            SizedBox(height: 5),
            Text('$localAuthState', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
