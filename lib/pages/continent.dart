import 'package:flutter/material.dart';
import 'listcity.dart';

class ContinentPage extends StatelessWidget {
  final List<String> continents = ['América', 'Europa', 'Ásia', 'África', 'Oceania'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escolha o Continente')),
      body: ListView.builder(
        itemCount: continents.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(continents[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListCityPage(continent: continents[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
