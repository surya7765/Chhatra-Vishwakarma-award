import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vishwakarma/views/.env.dart';
import 'package:vishwakarma/widgets/direction_model.dart';

class DirectionRepo {
  static const _baseUrl = 'http://maps.googleapis.com/maps/api/geocode/json?';
  final Dio _dio;
  DirectionRepo({Dio dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections({
    @required LatLng origin,
    @required LatLng destination,
  }) async {
    final response = await _dio.get(_baseUrl, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': GoogleAPIKey,
    });
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
