import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places_provider.dart';
import 'package:great_places/utils/route_screens.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
        future: Provider.of<GreatPlacesProvider>(
          context,
          listen: false,
        ).loadPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<GreatPlacesProvider>(
                child: Center(child: Text("Nenhum item adicionado...")),
                builder: (ctx, greatPlaces, ch) => greatPlaces.itemCount == 0
                    ? ch!
                    : ListView.builder(
                        itemCount: greatPlaces.itemCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.itemByIndex(i).image,
                            ),
                          ),
                          title: Text(greatPlaces.itemByIndex(i).title),
                          subtitle: Text(
                            greatPlaces.itemByIndex(i).location.address,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRouteScreens.placeDetailScreen,
                              arguments: greatPlaces.itemByIndex(i),
                            );
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
