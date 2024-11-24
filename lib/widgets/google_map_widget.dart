import 'package:flutter/material.dart';

class GoogleMapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;

  const GoogleMapWidget({super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          'Google Map\nLat: $latitude\nLng: $longitude',
          style: const TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
