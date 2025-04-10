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
