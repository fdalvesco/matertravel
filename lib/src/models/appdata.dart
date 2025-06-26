import 'package:shared_preferences/shared_preferences.dart';

class City {
  final String placeName;
  final String imagePath;
  final String city;
  final String description;
  final double latitude;
  final double longitude;

  City({
    required this.placeName,
    required this.imagePath,
    required this.city,
    required this.description,
    required this.latitude,
    required this.longitude,
  });
}

class AppData {
  static List<City> cities = [
    // Curitiba
    City(
      placeName: 'Jardim Botânico',
      imagePath: 'assets/jardim_botanico.jpg',
      city: 'Curitiba',
      description: 'Um dos cartões-postais de Curitiba, com estufa icônica e jardins geométricos.',
      latitude: -25.4322,
      longitude: -49.2532,
    ),
    City(
      placeName: 'Ópera de Arame',
      imagePath: 'assets/opera_de_arame.jpg',
      city: 'Curitiba',
      description: 'Teatro com estrutura metálica cercado por natureza e um lago.',
      latitude: -25.4436,
      longitude: -49.2766,
    ),
    City(
      placeName: 'Centro Histórico',
      imagePath: 'assets/centro_historico.jpg',
      city: 'Curitiba',
      description: 'Área charmosa com casarões antigos, igrejas e bares culturais.',
      latitude: -25.4296,
      longitude: -49.2710,
    ),
    City(
      placeName: 'Teatro do Paiol',
      imagePath: 'assets/teatro_paiol.jpg',
      city: 'Curitiba',
      description: 'Antigo paiol de pólvora transformado em espaço cultural.',
      latitude: -25.4411,
      longitude: -49.2646,
    ),
    City(
      placeName: 'Feira do Largo da Ordem',
      imagePath: 'assets/largo_ordem.jpg',
      city: 'Curitiba',
      description: 'Feira tradicional com artesanato, comida e apresentações culturais aos domingos.',
      latitude: -25.4321,
      longitude: -49.2699,
    ),
    City(
      placeName: 'Museu Oscar Niemeyer',
      imagePath: 'assets/museu_oscar_niemeyer.jpg',
      city: 'Curitiba',
      description: 'Museu de arte moderna com arquitetura única em formato de olho.',
      latitude: -25.4377,
      longitude: -49.2743,
    ),

    // Foz do Iguaçu
    City(
      placeName: 'Cataratas do Iguaçu',
      imagePath: 'assets/cataratas.jpg',
      city: 'Foz do Iguaçu',
      description: 'Uma das maiores e mais impressionantes quedas d’água do mundo.',
      latitude: -25.6953,
      longitude: -54.4367,
    ),
    City(
      placeName: 'Ice Bar',
      imagePath: 'assets/ice_bar.jpg',
      city: 'Foz do Iguaçu',
      description: 'Bar feito totalmente de gelo, com temperatura abaixo de zero.',
      latitude: -25.5697,
      longitude: -54.5880,
    ),
    City(
      placeName: 'Iporã Lenda Show',
      imagePath: 'assets/ipora_show.jpg',
      city: 'Foz do Iguaçu',
      description: 'Espetáculo cultural que mostra a diversidade folclórica latino-americana.',
      latitude: -25.5631,
      longitude: -54.5863,
    ),
  ];

  static List<City> favorites = [];

  static const String _favoritesKey = 'favorites';

  static Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedList = prefs.getStringList(_favoritesKey) ?? [];

    favorites = cities.where((city) => savedList.contains(city.placeName)).toList();
  }

  static Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteNames = favorites.map((c) => c.placeName).toList();
    await prefs.setStringList(_favoritesKey, favoriteNames);
  }

  static Future<void> toggleFavorite(City city) async {
    if (favorites.contains(city)) {
      favorites.remove(city);
    } else {
      favorites.add(city);
    }
    await _saveFavorites();
  }

  static bool isFavorite(City city) {
    return favorites.contains(city);
  }
}
