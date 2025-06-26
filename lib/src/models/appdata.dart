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
      description: 'Inaugurado em 1991, o Jardim Botânico é um dos pontos mais visitados de Curitiba. Sua estrutura é inspirada nos jardins franceses e logo na entrada os visitantes são recebidos com um imenso tapete de flores. A estufa, em estrutura metálica, abriga diversas espécies de plantas, além de uma fonte d’água, espaço para exposições, biblioteca e auditório.',
      latitude: -25.4429,
      longitude: -49.2406,
    ),
    City(
      placeName: 'Ópera de Arame',
      imagePath: 'assets/opera_de_arame.jpg',
      city: 'Curitiba',
      description: 'A estrutura tubular com teto transparente é palco para todo tipo de espetáculo e tem capacidade para 1.572 pessoas. Está situada entre lagos e cascatas do Parque das Pedreiras, juntamente com o Espaço Cultural Paulo Leminski, cenário da encenação da Paixão de Cristo e de outros grandes eventos.',
      latitude: -25.3846,
      longitude: -49.2655,
    ),
    City(
      placeName: 'Centro Histórico',
      imagePath: 'assets/centro_historico.jpg',
      city: 'Curitiba',
      description: 'O Centro Histórico, popularmente conhecido com Largo da Ordem, compreende o atual bairro de São Francisco e parte do Centro de Curitiba. Inclui construções como o Museu Paranaense, a colorida Mesquita Imam Ali Ibn Abi Talib, o Palácio Garibaldi, o Relógio das Flores, o Solar do Rosário e o Memorial de Curitiba.',
      latitude: -25.4293,
      longitude: -49.2719,
    ),
    City(
      placeName: 'Teatro do Paiol',
      imagePath: 'assets/teatro_paiol.jpg',
      city: 'Curitiba',
      description: 'O Teatro do Paiol é um antigo abrigo de pólvora, transformado no primeiro teatro de arena da cidade num ousado projeto do arquiteto Abrão Assad. O espaço, que mantém as características originais da edificação (com a configuração de construção romana em forma circular), recebe importantes espetáculos de música e teatro.',
      latitude: -25.4265,
      longitude: -49.2595,
    ),
    City(
      placeName: 'Feira do Largo da Ordem',
      imagePath: 'assets/largo_ordem.jpg',
      city: 'Curitiba',
      description: 'Programa típico de domingo, a feira reúne barraquinhas que vendem artesanato, roupas, brinquedos, antiguidades e delícias como pinhão cozido. Ali pertinho fica o Bar do Alemão, famoso pelo chope e pela carne de onça (prato feito de carne moída crua temperada). A feira recebe ainda exposições de carros antigos e shows de música.',
      latitude: -25.4289,
      longitude: -49.2677,
    ),
    City(
      placeName: 'Museu Oscar Niemeyer',
      imagePath: 'assets/museu_oscar_niemeyer.jpg',
      city: 'Curitiba',
      description: 'Principal museu do Paraná e popularmente conhecido como “Museu do Olho”, foi projetado por Oscar Niemeyer. No acervo estão obras contemporâneas e diversas exposições temporárias acontecem ali, de artistas ligados às artes visuais nacionais e estrangeiras. O museu ainda possui um charmoso café, loja e esculturas nos jardins, uma delas da artista plástica Tomie Ohtake.',
      latitude: -25.4336,
      longitude: -49.2663,
    ),
    // Foz do Iguaçu
    City(
      placeName: 'Cataratas do Iguaçu',
      imagePath: 'assets/cataratas.jpg',
      city: 'Foz do Iguaçu',
      description: "O Parque Nacional do Iguaçu é Patrimônio Natural da Humanidade pela UNESCO e abriga as famosas quedas d'água e um santuário ecológico. Do lado argentino, o ângulo é diferente. De lá é possível ver a Garganta do Diabo do alto, sobre o trecho mais turbulento do rio.",
      latitude: -25.6953,
      longitude: -54.4367,
    ),
    City(
      placeName: 'Ice Bar',
      imagePath: 'assets/ice_bar.jpg',
      city: 'Foz do Iguaçu',
      description: 'O Dreams Ice Bar é uma experiência glacial em meio a uma das cidades mais quentes do país. Paredes, copos, decoração, tudo feito de gelo para você desfrutar um open bar com drinks com e sem álcool e muita diversão para adultos e crianças.',
      latitude: -25.5123,
      longitude: -54.5912,
    ),
    City(
      placeName: 'Iporã Lenda Show',
      imagePath: 'assets/ipora_show.jpg',
      city: 'Foz do Iguaçu',
      description: 'Com origem no tupi-guarani, o nome traduz a beleza das águas, representado aqui por uma apresentação que demonstra a diversidade cultural de nove países da América Latina.',
      latitude: -25.5157,
      longitude: -54.5834,
    ),
  ];
}
