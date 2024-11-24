import 'package:flutter/material.dart';
import 'package:tcs_locator/models/location_model.dart';

class LocationCard extends StatelessWidget {
  final Location location;

  const LocationCard(
      {super.key,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(location.centerName),
        subtitle: Text('${location.location} - ${location.area}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushReplacementNamed(
            context,
            '/locationDetail',
            arguments: location.toJson(),
          );
        },
      ),
    );
  }
}
