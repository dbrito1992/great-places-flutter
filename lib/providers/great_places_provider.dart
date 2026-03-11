import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_utils.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUltils.getPlaces('places');
    PlaceLocation location = PlaceLocation("", latitude: "", longitude: "");

    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            location: location,
            title: item['title'],
            image: item['image'],
          ),
        )
        .toList();
    notifyListeners();
  }

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
    DbUltils.insert('places', {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path,
    });
    notifyListeners();
  }
}
