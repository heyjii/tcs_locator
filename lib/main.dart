import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcs_locator/repositories/location_repository.dart';
import 'package:tcs_locator/screens/location_listing_screen.dart';
import 'package:tcs_locator/screens/splash_screen.dart';

import 'blocs/location_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => const SplashScreen(),
        '/locations': (context) => BlocProvider(
          create: (context) =>
              LocationBloc(LocationRepository()),
          child: const LocationListingScreen(),
        ),
      },
    );
  }
}