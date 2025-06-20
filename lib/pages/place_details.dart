import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailPage extends StatefulWidget {
  final String name;
  final String imagePath;
  final String description;

  const PlaceDetailPage({
    super.key,
    required this.name,
    required this.imagePath,
    required this.description,
  });

  @override
  State<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  bool isFavorite = false;

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Serviço de localização desativado.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Permissão de localização negada';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Permissão de localização negada permanentemente';
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  void openGoogleMapsDirections(double latUser, double lonUser) async {
    // Coordenadas fixas do Parque Ibirapuera
    const double latDest = -23.5874;
    const double lonDest = -46.6576;

    final url = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&origin=$latUser,$lonUser&destination=$latDest,$lonDest&travelmode=driving',
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir o Google Maps.';
    }
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorite
            ? '${widget.name} adicionado aos favoritos.'
            : '${widget.name} removido dos favoritos.'),
      ),
    );

    // Aqui você pode salvar no banco local, no shared_preferences, etc.
    // Por enquanto, só exibe o aviso.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.description,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              try {
                final position = await getCurrentLocation();
                openGoogleMapsDirections(position.latitude, position.longitude);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro: $e')),
                );
              }
            },
            child: const Text('Como chegar até o Parque Ibirapuera'),
          ),
        ],
      ),
    );
  }
}
