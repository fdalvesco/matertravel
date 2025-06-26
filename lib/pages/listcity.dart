import 'package:flutter/material.dart';
import 'city.dart';

class ListCityPage extends StatelessWidget {
  final List<String> cities = ['Curitiba', 'Foz do Iguaçu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conheça o Paraná')),
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
