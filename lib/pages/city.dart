import 'package:flutter/material.dart';
import '../widgets/citybox.dart';
import 'place_details.dart';

class CityPage extends StatelessWidget {
  final String cityName;

  CityPage({required this.cityName});

  final Map<String, List<Map<String, String>>> cityPlaces = {
    'São Paulo': [
      {
        'name': 'Parque Ibirapuera',
        'image': 'assets/ibirapuera.jpg',
        'description': 'Um dos maiores parques urbanos do Brasil, com áreas verdes, museus e atividades ao ar livre.'
      },
      {
        'name': 'Avenida Paulista',
        'image': 'assets/paulista.jpg',
        'description': 'Principal avenida de São Paulo, conhecida por centros culturais, lojas, empresas e eventos.'
      },
    ],
    'Buenos Aires': [
      {
        'name': 'Caminito',
        'image': 'assets/caminito.jpg',
        'description': 'Rua colorida e turística em La Boca, famosa por sua arte, música e dançarinos de tango.'
      },
    ],
    'Paris': [
      {
        'name': 'Torre Eiffel',
        'image': 'assets/eiffel.jpg',
        'description': 'Símbolo icônico da França, oferece uma vista panorâmica incrível de Paris.'
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final places = cityPlaces[cityName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('Lugares em $cityName')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: places.map((place) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailPage(
                    name: place['name']!,
                    imagePath: place['image']!,
                    description: place['description']!,
                  ),
                ),
              );
            },
            child: CityBox(
              name: place['name']!,
              imagePath: place['image']!,
              city: cityName,
            ),
          );
        }).toList(),
      ),
    );
  }
}
