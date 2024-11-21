import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tcs_locator/models/location_model.dart';

class LocationRepository {
  Future<List<Location>> fetchLocations() async {
    // dio.interceptors.add(
    //   LogInterceptor(
    //     logPrint: (o) => debugPrint(o.toString()),
    //   ),
    // );
    //
    // dio.options.headers['content-Type'] = 'application/json';
    //
    // try {
    //   Response response = await Dio().get("https://api.restful-api.dev/objects");
    //   if (response.statusCode == 200) {
    //     final data = response.data; // Assuming the data is in a Map
    //     final List<Location> locations = Location.fromJsonList(data);
    //     return locations;
    //   }
    //   else {
    //     return [];
    //   }
    // } catch (e) {
    //   throw Exception('Failed to fetch locations: $e');
    // }

    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5), // 5 seconds
        receiveTimeout: const Duration(seconds: 5), // 5 seconds
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    const String url =
        'https://www.tcs.com/content/dam/global-tcs/en/worldwide-json/worldwide-map-5-12.json'; // Replace with your URL

    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        debugPrint('Response data: $data');
        final List<Location> locations = Location.fromJsonList(data);
        return locations;
      } else {
        debugPrint('Error: Received status code ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Exception caught: $e');
      throw Exception('Failed to fetch locations: $e');
    }
  }
}
