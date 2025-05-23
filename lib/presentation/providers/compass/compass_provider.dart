import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final compassProvider = StreamProvider<double?>((ref) async* {
  if (FlutterCompass.events == null) {
    throw Exception('El dispositivo no tiene sensores');
  }
  try {
    await for (final event in FlutterCompass.events!) {
      yield event.heading ?? 0;
    }
  } catch (e) {
    throw Exception('Error obteniendo encabezado: $e');
  }
});
