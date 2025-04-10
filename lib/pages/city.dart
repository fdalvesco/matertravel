import 'package:flutter/material.dart';
import '../widgets/citybox.dart';

class CityPage extends StatelessWidget {
  final String cityName;

  CityPage({required this.cityName});

  final Map<String, List<Map<String, String>>> cityPlaces = {
    'São Paulo': [
      {'name': 'Parque Ibirapuera', 'image': 'assets/ibirapuera.jpg'},
      {'name': 'Avenida Paulista', 'image': 'assets/paulista.jpg'},
    ],
    'Buenos Aires': [
      {'name': 'Caminito', 'image': 'assets/caminito.jpg'},
    ],
    'Paris': [
      {'name': 'Torre Eiffel', 'image': 'assets/eiffel.jpg'},
    ],
    // Adicione mais conforme desejar
  };

  @override
  Widget build(BuildContext context) {
    final places = cityPlaces[cityName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('Lugares em $cityName')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: places.map((place) {
          return CityBox(name: place['name']!, imagePath: place['image']!);
        }).toList(),
      ),
    );
  }
}
