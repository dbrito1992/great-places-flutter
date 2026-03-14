import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const GOOGLE_KEY_API = "AIzaSyDaglcI5rA9QnA1_hneh4Ab4_n3abLS8w4";

class LocationUtils {
  static String generateImagePreview({
    double longitude = 0,
    double latitude = 0,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_KEY_API';
  }

  static Future<String> generateAddress(LatLng position) async {
    final response = await http.get(
      Uri.parse(
        'https://geocode.googleapis.com/v4beta/geocode/location?location.latitude=${position.latitude}&location.longitude=${position.longitude}&key=$GOOGLE_KEY_API',
      ),
    );

    return json.decode(response.body)['results'][0]['formattedAddress'];
  }
}



//https://geocode.googleapis.com/v4beta/geocode/location?location.latitude=37.4225508&location.longitude=-122.0846338&key=API_KEY