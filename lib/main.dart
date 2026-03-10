import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places_provider.dart';
import 'package:great_places/screens/place_form_screen.dart';
import 'package:great_places/screens/places_list_screens.dart';
import 'package:great_places/utils/route_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => GreatPlacesProvider()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
