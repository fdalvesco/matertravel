import 'package:flutter/material.dart';
import '../src/models/appdata.dart';
import '../widgets/citybox.dart';

class ListPlacePage extends StatelessWidget {
  final String cityName;

  const ListPlacePage({required this.cityName});

  @override
  Widget build(BuildContext context) {
    // Filtra os lugares da cidade selecionada
    final places = AppData.cities.where((c) => c.city == cityName).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pontos turísticos de $cityName'),
      ),
      body: places.isEmpty
          ? Center(child: Text('Nenhum ponto turístico encontrado.'))
          : ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return CityBox(
            name: place.placeName,
            imagePath: place.imagePath,
            city: place.city,
          );
        },
      ),
    );
  }
}
