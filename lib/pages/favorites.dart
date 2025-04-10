import 'package:flutter/material.dart';
import '../widgets/citybox.dart';
import '../src/models/appdata.dart';
import 'place_details.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteCities = AppData.favorites;

    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: favoriteCities.isEmpty
          ? Center(child: Text('Nenhum local favorito adicionado.'))
          : ListView.builder(
        itemCount: favoriteCities.length,
        itemBuilder: (context, index) {
          final city = favoriteCities[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailPage(
                    name: city.placeName,
                    imagePath: city.imagePath,
                    description: city.description,
                  ),
                ),
              );
            },
            child: CityBox(
              name: city.placeName,
              imagePath: city.imagePath,
              city: city.city,
            ),
          );
        },
      ),
    );
  }
}
