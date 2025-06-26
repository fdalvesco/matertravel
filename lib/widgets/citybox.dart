import 'package:flutter/material.dart';
import '../src/models/appdata.dart';
import '../pages/place_details.dart';
import '../pages/city.dart';

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
    // Curitiba
    'Jardim Botânico': 'Um dos pontos mais famosos da cidade.',
    'Ópera de Arame': 'Teatro com estrutura metálica única.',
    'Centro Histórico': 'Região central com arquitetura antiga.',
    'Teatro do Paiol': 'Espaço cultural tradicional da cidade.',
    'Feira do Largo da Ordem': 'Feira tradicional com artesanato e gastronomia.',
    'Museu Oscar Niemeyer': 'Museu de arte com arquitetura moderna.',
    // Foz do Iguaçu
    'Cataratas do Iguaçu': 'Maravilha natural do mundo.',
    'Ice Bar': 'Bar feito inteiramente de gelo.',
    'Iporã Lenda Show': 'Espetáculo cultural com lendas locais.',
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
              builder: (context) => PlaceDetailsPage(place: currentCity),
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
