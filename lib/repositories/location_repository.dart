import 'package:dio/dio.dart';
import 'package:tcs_locator/models/location_model.dart';

class LocationRepository {
  final Dio dio;

  LocationRepository({Dio? dio}) : dio = dio ?? Dio();

  Future<List<Location>> fetchLocations() async{
    final response = await dio.get('https://www.tcs.com/content/dam/global-tcs/en/worldwide-json/worldwide-map-5-12.json');
    return (response.data as List)
        .map((locationJson) => Location.fromJson(locationJson))
        .toList();
  }
}