import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers_barrel.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPositionAsync = ref.watch(userLocationProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Mapa')),
      body: currentPositionAsync.when(
        data: (data) => _MapView(initialLat: data.$1, initialLong: data.$2),
        error: (error, stackTrace) => Text('$error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _MapView extends StatefulWidget {
  final double initialLat;
  final double initialLong;
  const _MapView({required this.initialLat, required this.initialLong});

  @override
  State<_MapView> createState() => __MapViewState();
}

class __MapViewState extends State<_MapView> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLat, widget.initialLong),
        zoom: 12,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        // _controller.complete(controller);
      },
    );
  }
}
