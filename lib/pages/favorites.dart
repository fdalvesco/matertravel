import 'package:flutter/material.dart';
import '../src/models/appdata.dart';
import 'place_details.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = AppData.favorites;

    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: favorites.isEmpty
          ? Center(child: Text('Nenhum favorito adicionado.'))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final place = favorites[index];
          return ListTile(
            leading: Image.asset(place.imagePath, width: 50, fit: BoxFit.cover),
            title: Text(place.placeName),
            subtitle: Text(place.city),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailsPage(place: place),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
