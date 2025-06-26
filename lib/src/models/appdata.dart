import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../pages/city.dart';

class AppData {
  static List<City> favorites = [];

  static const String favoritesKey = 'favorites';

  static Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favsJson = prefs.getStringList(favoritesKey);
    if (favsJson != null) {
      favorites = favsJson.map((jsonStr) {
        final Map<String, dynamic> map = jsonDecode(jsonStr);
        return City(
          placeName: map['placeName'],
          imagePath: map['imagePath'],
          city: map['city'],
          description: map['description'],
          latitude: map['latitude'],
          longitude: map['longitude'],
        );
      }).toList();
    } else {
      favorites = [];
    }
  }

  static Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favsJson = favorites.map((city) => jsonEncode({
      'placeName': city.placeName,
      'imagePath': city.imagePath,
      'city': city.city,
      'description': city.description,
      'latitude': city.latitude,
      'longitude': city.longitude,
    })).toList();
    await prefs.setStringList(favoritesKey, favsJson);
  }

  static bool isFavorite(City city) {
    return favorites.contains(city);
  }

  static void addFavorite(City city) {
    if (!favorites.contains(city)) {
      favorites.add(city);
      saveFavorites();
    }
  }

  static void removeFavorite(City city) {
    favorites.remove(city);
    saveFavorites();
  }

  static void toggleFavorite(City city) {
    if (isFavorite(city)) {
      removeFavorite(city);
    } else {
      addFavorite(city);
    }
  }

  static List<City> cities = [
    // Curitiba
    City(
      placeName: 'Jardim Botânico',
      imagePath: 'assets/jardim_botanico.jpg',
      city: 'Curitiba',
      description: 'Um dos pontos mais famosos da cidade.',
      latitude: -25.4429,
      longitude: -49.2406,
    ),
    City(
      placeName: 'Ópera de Arame',
      imagePath: 'assets/opera_arame.jpg',
      city: 'Curitiba',
      description: 'Teatro com estrutura metálica única.',
      latitude: -25.3846,
      longitude: -49.2655,
    ),
    City(
      placeName: 'Centro Histórico',
      imagePath: 'assets/centro_historico.jpg',
      city: 'Curitiba',
      description: 'Região central com arquitetura antiga.',
      latitude: -25.4293,
      longitude: -49.2719,
    ),
    City(
      placeName: 'Teatro do Paiol',
      imagePath: 'assets/teatro_paiol.jpg',
      city: 'Curitiba',
      description: 'Espaço cultural tradicional da cidade.',
      latitude: -25.4265,
      longitude: -49.2595,
    ),
    City(
      placeName: 'Feira do Largo da Ordem',
      imagePath: 'assets/feira_largo_ordem.jpg',
      city: 'Curitiba',
      description: 'Feira tradicional com artesanato e gastronomia.',
      latitude: -25.4289,
      longitude: -49.2677,
    ),
    City(
      placeName: 'Museu Oscar Niemeyer',
      imagePath: 'assets/museu_oscar_niemeyer.jpg',
      city: 'Curitiba',
      description: 'Museu de arte com arquitetura moderna.',
      latitude: -25.4336,
      longitude: -49.2663,
    ),
    // Foz do Iguaçu
    City(
      placeName: 'Cataratas do Iguaçu',
      imagePath: 'assets/cataratas.jpg',
      city: 'Foz do Iguaçu',
      description: 'Maravilha natural do mundo.',
      latitude: -25.6953,
      longitude: -54.4367,
    ),
    City(
      placeName: 'Ice Bar',
      imagePath: 'assets/ice_bar.jpg',
      city: 'Foz do Iguaçu',
      description: 'Bar feito inteiramente de gelo.',
      latitude: -25.5123,
      longitude: -54.5912,
    ),
    City(
      placeName: 'Iporã Lenda Show',
      imagePath: 'assets/ipora_lenda_show.jpg',
      city: 'Foz do Iguaçu',
      description: 'Espetáculo cultural com lendas locais.',
      latitude: -25.5157,
      longitude: -54.5834,
    ),
  ];
}
