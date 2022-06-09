import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({Key? key}) : super(key: key);

  @override
  _SimpleMapScreenState createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition = CameraPosition(
      target: LatLng(34.04633684784594, -118.26758436735804), zoom: 14.0);

  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(-8.116372673647, 115.0879686310941),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cek Lokasi Rumah Sakit"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        markers: markers,
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            goToHospital();
          },
          label: const Text("Go to Hospital"),
          icon: const Icon(Icons.local_hospital)),
    );
  }

  Future<void> goToHospital() async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));

    markers.add(Marker(
        markerId: const MarkerId(''),
        position: LatLng(-8.109854384922444, 115.08665051523116)));

    setState(() {});
  }
}
