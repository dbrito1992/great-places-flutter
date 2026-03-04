import 'package:flutter/material.dart';
import 'package:great_places/utils/route_screens.dart';

class PlacesListScreens extends StatelessWidget {
  const PlacesListScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Lugares"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRouteScreens.formPlacesScreen);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
