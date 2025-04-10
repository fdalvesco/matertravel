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
    'Parque Ibirapuera': 'O parque mais famoso da cidade reúne todo tipo de público: famílias, equipes amadoras de corrida, turistas, praticantes de yoga... Em seu 1,5 km² há muito verde, além de lagos, museus, ciclovia, quadras poliesportivas e parquinhos. Edifícios como a Oca, o Planetário e o Auditório são exemplos da emblemática arquitetura de Oscar Niemeyer, e os jardins foram concebidos pelo paisagista Roberto Burle Marx. No espaço conhecido como Parque dos Cachorros, entre os portões 6 e 7, cães andam soltos.',
    'Avenida Paulista': 'Um dos principais símbolos da capital, a avenida é pólo de negócios e também de cultura e entretenimento, com muitos restaurantes, bares e lojas. Aos domingos e feriados, não há circulação de carros e a Paulista se transforma em área de lazer, atraindo ciclistas, skatistas, artistas de rua e vendedores de artesanato. Não deixe de passar pelo Masp, um dos museus mais importantes da capital, e pelo Parque Trianon, área verde do outro lado da avenida.',
    'Caminito': 'Rua colorida e turística em La Boca, famosa por sua arte, música e dançarinos de tango.',
    'Torre Eiffel': 'Símbolo icônico da França, oferece uma vista panorâmica incrível de Paris.',
  };

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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaceDetailPage(
                name: widget.name,
                imagePath: widget.imagePath,
                description: descriptions[widget.name] ?? 'Descrição não encontrada.',
              ),
            ),
          );
        },
        leading: Image.asset(widget.imagePath, width: 50),
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
