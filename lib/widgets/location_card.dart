import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String title;

  final String area;

  final String location;

  const LocationCard(
      {super.key,
      required this.title,
      required this.area,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(title),
        subtitle: Text('$location - $area'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Handle tap event
          debugPrint("Item tapped");
        },
      ),
    );
  }
}
