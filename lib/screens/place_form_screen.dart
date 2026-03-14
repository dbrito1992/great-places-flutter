import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/providers/great_places_provider.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File? _imagePicked;
  LatLng? _pickedPosition;

  void _submitForm() {
    if (_imagePicked == null ||
        _titleController.text == '' ||
        _pickedPosition == null) {
      return;
    }

    Provider.of<GreatPlacesProvider>(
      context,
      listen: false,
    ).addPlace(_titleController.text, _imagePicked!, _pickedPosition!);

    Navigator.of(context).pop();
  }

  void _selectImage(File imagePicked) {
    setState(() {
      _imagePicked = imagePicked;
    });
  }

  void _selectPosition(LatLng position) {
    _pickedPosition = position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário")),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: "Texto!"),
                    ),
                    SizedBox(height: 10),
                    ImageInput(onSelectImage: _selectImage),
                    SizedBox(height: 10),
                    LocationInput(onSelectPosition: _selectPosition),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Colors.white,
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
            ),
            label: Text("Adicionar"),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
