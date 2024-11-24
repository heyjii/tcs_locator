import 'package:flutter/material.dart';
import 'package:tcs_locator/models/location_model.dart';

import '../widgets/google_map_widget.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> locationJson =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final location = Location.fromJson(locationJson);

    return Scaffold(
      appBar: AppBar(title: Text(location.centerName)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GoogleMapWidget(
              latitude: location.latitude,
              longitude: location.longitude,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'TCS Center Name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  subtitle: Text(
                    location.centerName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  trailing: const Icon(Icons.business),
                ),
                ListTile(
                  title: const Text(
                    'Location',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  subtitle: Text(
                    '${location.location} - ${location.area}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  trailing: const Icon(Icons.location_pin),
                ),
                ListTile(
                  title: const Text(
                    'Phone',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  subtitle: Text(
                    location.phone,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  trailing: const Icon(Icons.phone),
                ),
                ListTile(
                  title: const Text(
                    'Email',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  subtitle: Text(
                    location.email,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  trailing: const Icon(Icons.email),
                ),
                ListTile(
                  title: const Text(
                    'Address',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  subtitle: Text(
                    location.address,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ),
                ListTile(
                  title: const Text(
                    'Office Type',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  subtitle: Text(
                    location.officeType,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
