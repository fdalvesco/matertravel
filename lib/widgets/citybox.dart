import 'package:flutter/material.dart';
import '../src/models/appdata.dart';
import '../pages/place_details.dart';

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

  final Map<String, String> descriptions = {
    'Parque Ibirapuera': 'O parque mais famoso da cidade reúne todo tipo de público...',
    'Avenida Paulista': 'Um dos principais símbolos da capital, com cultura e lazer.',
    'Caminito': 'Rua colorida e turística em La Boca, famosa por sua arte e tango.',
    'Torre Eiffel': 'Símbolo icônico da França, com vista panorâmica de Paris.',
    // Adicione outras descrições conforme necessário
  };

  @override
  void initState() {
    super.initState();
    currentCity = AppData.cities.firstWhere(
          (c) => c.placeName == widget.name && c.city == widget.city,
      orElse: () => City(
        placeName: widget.name,
        imagePath: widget.imagePath,
        city: widget.city,
        description: descriptions[widget.name] ?? 'Descrição não encontrada.',
        latitude: 0.0,
        longitude: 0.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFav = AppData.isFavorite(currentCity);

    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaceDetailPage(city: currentCity),
            ),
          );
        },
        leading: Image.asset(widget.imagePath, width: 50, fit: BoxFit.cover),
        title: Text(widget.name),
        subtitle: Text(widget.city),
        trailing: IconButton(
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : null,
          ),
          onPressed: () async {
            setState(() {
              AppData.toggleFavorite(currentCity);
            });
            await AppData.toggleFavorite(currentCity);
          },
        ),
      ),
    );
  }
}
