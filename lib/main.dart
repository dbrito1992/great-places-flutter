import 'package:flutter/material.dart';
import 'package:great_places/screens/place_form_screen.dart';
import 'package:great_places/screens/places_list_screens.dart';
import 'package:great_places/utils/route_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        colorScheme: .fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo,
          secondary: Colors.blueAccent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: PlacesListScreens(),
      routes: {AppRouteScreens.formPlacesScreen: (ctx) => PlaceFormScreen()},
    );
  }
}
