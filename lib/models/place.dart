import 'dart:io';

class PlaceLocation {
  final String longitude;
  final String latitude;
  final String address;

  PlaceLocation(
    this.address, {
    required this.latitude,
    required this.longitude,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.location,
    required this.title,
    required this.image,
  });
}
