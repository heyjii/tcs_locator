import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcs_locator/widgets/location_card.dart';

import '../blocs/location_bloc.dart';
import '../blocs/location_event.dart';
import '../blocs/location_state.dart';

class LocationListingScreen extends StatefulWidget {
  const LocationListingScreen({super.key});

  @override
  State<LocationListingScreen> createState() => _LocationListingScreenState();
}

class _LocationListingScreenState extends State<LocationListingScreen> {

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(FetchLocations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('TCS Locator'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Image.asset('assets/images/tcs_logo.png'), // Path to your logo
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                return TextField(
                  decoration: InputDecoration(
                    hintText: "Search locations...",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.sort),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (query) {
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LocationLoaded) {
            return ListView.builder(
              itemCount: state.locations.length,
              itemBuilder: (context, index) {
                final location = state.locations[index];
                return ListTile(
                  title: Text(location.centerName),
                  subtitle: Text('${location.location} - ${location.area}'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/locationDetail',
                      arguments: location.toJson(),
                    );
                  },
                );
              },
            );
          } else if (state is LocationError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Press fetch to get locations'));
        },
      ),
    );
  }
}
