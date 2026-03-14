import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialCameraPosition;
  final bool isReadyOnly;

  const MapScreen({
    this.initialCameraPosition = const PlaceLocation(
      "Google",
      latitude: 37.422,
      longitude: -122.084,
    ),
    this.isReadyOnly = false,
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  void _selectedPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione no mapa..."),
        actions: [
          TextButton.icon(
            onPressed: _pickedPosition == null
                ? null
                : () {
                    Navigator.of(context).pop(_pickedPosition);
                  },
            label: Text(""),
            icon: Icon(Icons.check, color: Colors.white),
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialCameraPosition.latitude,
            widget.initialCameraPosition.longitude,
          ),
          zoom: 13,
        ),
        onTap: widget.isReadyOnly ? null : _selectedPosition,
        markers: {
          if (_pickedPosition != null)
            Marker(markerId: const MarkerId('p1'), position: _pickedPosition!),
        },
      ),
    );
  }
}
