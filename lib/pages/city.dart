import 'package:flutter/material.dart';
import '../src/models/appdata.dart';
import 'place_details.dart';

class CityPage extends StatelessWidget {
  final String cityName;

  const CityPage({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final places = _getPlacesForCity(cityName);

    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          final city = City(
            placeName: place['name']!,
            imagePath: place['imagePath']!,
            city: cityName,
            description: place['description']!,
            latitude: double.parse(place['latitude']!),
            longitude: double.parse(place['longitude']!),
          );

          return ListTile(
            leading: Image.asset(
              place['imagePath']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(place['name']!),
            subtitle: Text(cityName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailPage(city: city),
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<Map<String, String>> _getPlacesForCity(String city) {
    switch (city) {
      case 'Curitiba':
        return [
          {
            'name': 'Jardim Botânico',
            'imagePath': 'assets/jardim_botanico.jpg',
            'description': 'Inaugurado em 1991, o Jardim Botânico é um dos pontos mais visitados de Curitiba. Sua estrutura é inspirada nos jardins franceses e logo na entrada os visitantes são recebidos com um imenso tapete de flores. A estufa, em estrutura metálica, abriga diversas espécies de plantas, além de uma fonte d’água, espaço para exposições, biblioteca e auditório.',
            'latitude': '-25.443245',
            'longitude': '-49.237423',
          },
          {
            'name': 'Ópera de Arame',
            'imagePath': 'assets/opera_de_arame.jpg',
            'description': 'A estrutura tubular com teto transparente é palco para todo tipo de espetáculo e tem capacidade para 1.572 pessoas. Está situada entre lagos e cascatas do Parque das Pedreiras, juntamente com o Espaço Cultural Paulo Leminski, cenário da encenação da Paixão de Cristo e de outros grandes eventos.',
            'latitude': '-25.384328',
            'longitude': '-49.271056',
          },
          {
            'name': 'Centro Histórico',
            'imagePath': 'assets/centro_historico.jpg',
            'description': 'O Centro Histórico, popularmente conhecido com Largo da Ordem, compreende o atual bairro de São Francisco e parte do Centro de Curitiba. Inclui construções como o Museu Paranaense, a colorida Mesquita Imam Ali Ibn Abi Talib, o Palácio Garibaldi, o Relógio das Flores, o Solar do Rosário e o Memorial de Curitiba.',
            'latitude': '-25.428954',
            'longitude': '-49.271816',
          },
          {
            'name': 'Teatro do Paiol',
            'imagePath': 'assets/teatro_paiol.jpg',
            'description': 'O Teatro do Paiol é um antigo abrigo de pólvora, transformado no primeiro teatro de arena da cidade num ousado projeto do arquiteto Abrão Assad. O espaço, que mantém as características originais da edificação (com a configuração de construção romana em forma circular), recebe importantes espetáculos de música e teatro.',
            'latitude': '-25.436026',
            'longitude': '-49.260639',
          },
          {
            'name': 'Feira do Largo da Ordem',
            'imagePath': 'assets/largo_ordem.jpg',
            'description': 'Programa típico de domingo, a feira reúne barraquinhas que vendem artesanato, roupas, brinquedos, antiguidades e delícias como pinhão cozido. Ali pertinho fica o Bar do Alemão, famoso pelo chope e pela carne de onça (prato feito de carne moída crua temperada). A feira recebe ainda exposições de carros antigos e shows de música.',
            'latitude': '-25.428566',
            'longitude': '-49.271903',
          },
          {
            'name': 'Museu Oscar Niemeyer',
            'imagePath': 'assets/museu_oscar_niemeyer.jpg',
            'description': 'Principal museu do Paraná e popularmente conhecido como “Museu do Olho”, foi projetado por Oscar Niemeyer. No acervo estão obras contemporâneas e diversas exposições temporárias acontecem ali, de artistas ligados às artes visuais nacionais e estrangeiras. O museu ainda possui um charmoso café, loja e esculturas nos jardins, uma delas da artista plástica Tomie Ohtake.',
            'latitude': '-25.409347',
            'longitude': '-49.263754',
          },
        ];
      case 'Foz do Iguaçu':
        return [
          {
            'name': 'Cataratas do Iguaçu',
            'imagePath': 'assets/cataratas.jpg',
            'description': "O Parque Nacional do Iguaçu é Patrimônio Natural da Humanidade pela UNESCO e abriga as famosas quedas d'água e um santuário ecológico. Do lado argentino, o ângulo é diferente. De lá é possível ver a Garganta do Diabo do alto, sobre o trecho mais turbulento do rio.",
            'latitude': '-25.695278',
            'longitude': '-54.436667',
          },
          {
            'name': 'Ice Bar',
            'imagePath': 'assets/ice_bar.jpg',
            'description': 'O Dreams Ice Bar é uma experiência glacial em meio a uma das cidades mais quentes do país. Paredes, copos, decoração, tudo feito de gelo para você desfrutar um open bar com drinks com e sem álcool e muita diversão para adultos e crianças.',
            'latitude': '-25.596718',
            'longitude': '-54.555642',
          },
          {
            'name': 'Iporã Lenda Show',
            'imagePath': 'assets/ipora_show.jpg',
            'description': 'O Iporã Lenda Show é um show que reúne performances teatrais, música, dança e cultura. Através de apresentações de artistas e bailarinos, conseguimos conhecer um pouco da tradição e costumes de 9 países da América Latina: Chile, Peru, México, Argentina, Bolívia, Uruguai, Paraguai, Cuba e, claro, Brasil!',
            'latitude': '-25.542380',
            'longitude': '-54.588302',
          },
        ];
      default:
        return [];
    }
  }
}
