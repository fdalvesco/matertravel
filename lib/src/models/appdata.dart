import 'package:shared_preferences/shared_preferences.dart';

class City {
  final String placeName;
  final String imagePath;
  final String city;
  final String description;

  City({
    required this.placeName,
    required this.imagePath,
    required this.city,
    required this.description,
  });
}

class AppData {
  static List<City> cities = [
    City(
      placeName: 'Avenida Paulista',
      imagePath: 'assets/paulista.jpg',
      city: 'São Paulo',
      description: 'Principal avenida de São Paulo, conhecida por centros culturais, lojas, empresas e eventos.',
    ),
    City(
      placeName: 'Parque Ibirapuera',
      imagePath: 'assets/ibirapuera.jpg',
      city: 'São Paulo',
      description: 'Um dos maiores parques urbanos do Brasil, com áreas verdes, museus e atividades ao ar livre.',
    ),
  ];

  static List<City> favorites = [];

  // Chave para SharedPreferences
  static const String _favoritesKey = 'favorites';

  // Inicializa a lista de favoritos a partir do armazenamento local
  static Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedList = prefs.getStringList(_favoritesKey) ?? [];

    favorites = cities.where((city) => savedList.contains(city.placeName)).toList();
  }

  // Salva a lista de favoritos no armazenamento local
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
