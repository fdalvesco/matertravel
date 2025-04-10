import 'package:flutter/material.dart';
import '../src/models/appdata.dart';

class CityBox extends StatefulWidget {
  final String name;
  final String imagePath;
  final String city;

  const CityBox({
    required this.name,
    required this.imagePath,
    required this.city,
  });

  @override
  State<CityBox> createState() => _CityBoxState();
}

class _CityBoxState extends State<CityBox> {
  late City currentCity;

  @override
  void initState() {
    super.initState();
    currentCity = AppData.cities.firstWhere(
          (c) => c.placeName == widget.name && c.city == widget.city,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFav = AppData.isFavorite(currentCity);

    return Card(
      child: ListTile(
        leading: Image.asset(widget.imagePath, width: 50),
        title: Text(widget.name),
        subtitle: Text(widget.city),
        trailing: IconButton(
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : null),
          onPressed: () {
            setState(() {
              AppData.toggleFavorite(currentCity);
            });
          },
        ),
      ),
    );
  }
}
