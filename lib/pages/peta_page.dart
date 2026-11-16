import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PetaPage extends StatelessWidget {
  const PetaPage({super.key});

  static const CameraPosition kameraAwal = CameraPosition(
    target: LatLng(-6.9147, 107.6098),
    zoom: 12,
  );

  static final Set<Marker> markers = {
    Marker(
      markerId: const MarkerId('kantor1'),
      position: const LatLng(-6.9147, 107.6098),
      infoWindow: const InfoWindow(
        title: 'Kantor Layanan Pusat',
      ),
    ),
    Marker(
      markerId: const MarkerId('kantor2'),
      position: const LatLng(-6.9025, 107.6188),
      infoWindow: const InfoWindow(
        title: 'Kantor Layanan Utara',
      ),
    ),
    Marker(
      markerId: const MarkerId('kantor3'),
      position: const LatLng(-6.9344, 107.6049),
      infoWindow: const InfoWindow(
        title: 'Kantor Layanan Selatan',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: kameraAwal,
      markers: markers,
    );
  }
}