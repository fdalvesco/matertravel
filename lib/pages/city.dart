import 'package:flutter/material.dart';
import 'place_details.dart';

class CityPage extends StatelessWidget {
  final String cityName;

  const CityPage({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset(
              'assets/ibirapuera.jpg',  // caminho correto
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: const Text('Parque Ibirapuera'),
            subtitle: const Text('São Paulo - SP'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlaceDetailPage(
                    name: 'Parque Ibirapuera',
                    imagePath: 'assets/ibirapuera.jpg',  // caminho correto
                    description:
                    'O Parque Ibirapuera é um dos parques urbanos mais importantes de São Paulo, conhecido por sua beleza e atividades culturais.',
                  ),
                ),
              );
            },
          ),
          // Se quiser, você pode adicionar mais pontos turísticos aqui
        ],
      ),
    );
  }
}
