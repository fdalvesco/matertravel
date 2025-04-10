import 'package:flutter/material.dart';

class PlaceDetailPage extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;

  PlaceDetailPage({
    required this.name,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
