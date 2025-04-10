class City {
  final String placeName;
  final String imagePath;
  final String city;

  City({required this.placeName, required this.imagePath, required this.city});
}

class AppData {
  static List<City> cities = [
    City(placeName: 'Avenida Paulista', imagePath: 'lib/assets/paulista.jpg', city: 'São Paulo'),
    City(placeName: 'Parque Ibirapuera', imagePath: 'lib/assets/ibirapuera.jpg', city: 'São Paulo'),
  ];

  static List<City> favorites = [];

  static void toggleFavorite(City city) {
    if (favorites.contains(city)) {
      favorites.remove(city);
    } else {
      favorites.add(city);
    }
  }

  static bool isFavorite(City city) {
    return favorites.contains(city);
  }
}
