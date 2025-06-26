import 'package:flutter/material.dart';
import '../widgets/citybox.dart';
import '../src/models/appdata.dart';

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
          return CityBox(
            name: city.placeName,
            imagePath: city.imagePath,
            city: city.city,
          );
        },
      ),
    );
  }
}
