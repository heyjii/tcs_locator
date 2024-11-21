import 'package:flutter/material.dart';
import 'package:tcs_locator/screens/location_listing_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/locations');
    });
    
    return  Scaffold(
      body: Center(
        child: Image.asset('assets/images/tcs_logo.png')
      ),
    );
  }

}