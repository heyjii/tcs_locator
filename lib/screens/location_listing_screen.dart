import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/location_bloc.dart';
import '../blocs/location_event.dart';
import '../blocs/location_state.dart';

class LocationListingScreen extends StatelessWidget {
  const LocationListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Locations')),
      body:
      BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LocationLoaded) {
            return
              ListView.builder(
              itemCount: state.locations.length,
              itemBuilder: (context, index) {
                final location = state.locations[index];
                return Text(location.centerName);
              },
            );
          } else if (state is LocationError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Press fetch to get locations'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<LocationBloc>().add(FetchLocations()),
        child: const Icon(Icons.refresh),
      ),
    );
  }

}