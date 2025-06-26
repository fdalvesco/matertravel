import 'package:flutter/material.dart';
import 'list_place.dart';

class ListCityPage extends StatelessWidget {
  final List<String> cities = ['Curitiba', 'Foz do Iguaçu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinos no Paraná'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListPlacePage(cityName: cities[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
