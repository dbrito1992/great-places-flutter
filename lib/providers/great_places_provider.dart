import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    PlaceLocation location = PlaceLocation("", latitude: "", longitude: "");

    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: location,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
