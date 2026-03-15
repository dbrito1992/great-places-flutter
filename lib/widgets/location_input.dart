import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:great_places/utils/location_utils.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPosition;

  const LocationInput({required this.onSelectPosition, super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewLocation = '';

  String _showPreview(double latitude, double longitude) {
    return LocationUtils.generateImagePreview(
      longitude: latitude,
      latitude: longitude,
    );
  }

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();

    final generatePreview = _showPreview(
      locData.latitude as double,
      locData.longitude as double,
    );
    setState(() {
      _previewLocation = generatePreview;
    });
  }

  Future<void> _getLocationMap() async {
    final LatLng? selectedLocation = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => MapScreen()));

    if (selectedLocation == null) return;

    widget.onSelectPosition(selectedLocation);
    try {
      final generatePreview = _showPreview(
        selectedLocation.latitude,
        selectedLocation.longitude,
      );
      setState(() {
        _previewLocation = generatePreview;
      });
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: _previewLocation == ''
              ? Center(child: Text("Localização nao selecionada!"))
              : Image.network(
                  _previewLocation,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              label: Text("Localização Atual"),
              icon: Icon(Icons.location_on),
            ),

            TextButton.icon(
              onPressed: _getLocationMap,
              label: Text("Selecione no Map"),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
