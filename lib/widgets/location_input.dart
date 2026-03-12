import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewLocation = '';

  void _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
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
              onPressed: () {},
              label: Text("Selecione no Map"),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
