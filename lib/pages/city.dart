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
        'description': 'O parque mais famoso da cidade reúne todo tipo de público: famílias, equipes amadoras de corrida, turistas, praticantes de yoga... Em seu 1,5 km² há muito verde, além de lagos, museus, ciclovia, quadras poliesportivas e parquinhos. Edifícios como a Oca, o Planetário e o Auditório são exemplos da emblemática arquitetura de Oscar Niemeyer, e os jardins foram concebidos pelo paisagista Roberto Burle Marx. No espaço conhecido como Parque dos Cachorros, entre os portões 6 e 7, cães andam soltos.'
      },
      {
        'name': 'Avenida Paulista',
        'image': 'assets/paulista.jpg',
        'description': 'Um dos principais símbolos da capital, a avenida é pólo de negócios e também de cultura e entretenimento, com muitos restaurantes, bares e lojas. Aos domingos e feriados, não há circulação de carros e a Paulista se transforma em área de lazer, atraindo ciclistas, skatistas, artistas de rua e vendedores de artesanato. Não deixe de passar pelo Masp, um dos museus mais importantes da capital, e pelo Parque Trianon, área verde do outro lado da avenida.'
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
