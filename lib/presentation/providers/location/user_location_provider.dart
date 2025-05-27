import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final userLocationProvider = FutureProvider.autoDispose<(double latitude, double longitude)>((
  ref,
) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    throw 'Los servicios de localización estan desactivados';
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      throw 'Permisos de localización denegados';
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    throw 
      'Los permisos de ubicación están denegados permanentemente, no podemos solicitar permisos.';
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  final location = await Geolocator.getCurrentPosition();
  return (location.latitude, location.longitude);

  // return (1.1, 1.1);
});
