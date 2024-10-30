import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> markers = {
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(30.066, 31.326),
      // onTap: () {
      // },
      infoWindow: InfoWindow(
        title: "Hello this is your location",
      ),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(30.466, 31.126),
      // onTap: () {
      // },
      infoWindow: InfoWindow(
        title: "Hello this is your location",
      ),
    )
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(30.066, 31.326),
          zoom: 14,
        ),
        mapType: MapType.satellite,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        // buildingsEnabled: true,
        trafficEnabled: true,
        markers: markers,
        polylines: {
          Polyline(
            polylineId: PolylineId("1"),
            points: [
              LatLng(30.066, 31.326),
              LatLng(30.466, 31.126),
            ],
          )
        },
        onCameraMove: (position) {},
        onLongPress: (argument) {},
        onTap: (argument) {
          print(argument.latitude);
          print(argument.longitude);
        },
      ),
    );
  }
}
