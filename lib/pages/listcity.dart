import 'package:flutter/material.dart';
import 'city.dart';

class ListCityPage extends StatelessWidget {
  final String continent;

  ListCityPage({required this.continent});

  final Map<String, List<String>> citiesByContinent = {
    'América': ['São Paulo', 'Buenos Aires'],
    'Europa': ['Paris', 'Londres'],
    'Ásia': ['Tóquio', 'Pequim'],
    'África': ['Cairo', 'Cidade do Cabo'],
    'Oceania': ['Sydney', 'Auckland'],
  };

  @override
  Widget build(BuildContext context) {
    final cities = citiesByContinent[continent] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('Cidades da $continent')),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityPage(cityName: cities[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
