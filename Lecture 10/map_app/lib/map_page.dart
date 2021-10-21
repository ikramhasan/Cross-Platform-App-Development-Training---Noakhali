import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(23.6850, 90.3563),
          zoom: 7,
        ),
        mapType: MapType.normal,
        trafficEnabled: true,
        markers: {
          Marker(
            markerId: MarkerId('noakhali'),
            position: LatLng(
              22.8246,
              91.1017,
            ),
            draggable: true,
          ),
          Marker(
            markerId: MarkerId('feni'),
            position: LatLng(
              23.0159,
              91.3976,
            ),
            draggable: false,
          ),
        },
        compassEnabled: true,
      ),
    );
  }
}
