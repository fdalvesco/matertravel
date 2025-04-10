import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  final String name;
  final String imagePath;

  CityBox({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
