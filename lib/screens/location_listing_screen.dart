import 'package:flutter/material.dart';

class LocationListingScreen extends StatelessWidget {
  const LocationListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TCS Locator"),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text("Coming soon"),
      ),
    );
  }

}