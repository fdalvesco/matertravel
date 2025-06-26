import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../src/models/appdata.dart';

class PlaceDetailPage extends StatefulWidget {
  final City city;

  const PlaceDetailPage({super.key, required this.city});

  @override
  State<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = AppData.isFavorite(widget.city);
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw 'Serviço de localização desativado.';

    LocationPermission permission = await Geolocator.checkPermission();
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
    const double latDest = -25.4429;
    const double lonDest = -49.2768;

    final url = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&origin=$latUser,$lonUser&destination=$latDest,$lonDest&travelmode=driving',
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir o Google Maps.';
    }
  }

  void toggleFavorite() async {
    await AppData.toggleFavorite(widget.city);

    setState(() {
      isFavorite = AppData.isFavorite(widget.city);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? '${widget.city.placeName} adicionado aos favoritos.'
              : '${widget.city.placeName} removido dos favoritos.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final city = widget.city;

    return Scaffold(
      appBar: AppBar(
        title: Text(city.placeName),
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
            city.imagePath,
            fit: BoxFit.cover,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              city.description,
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
            child: const Text('Como chegar até o local'),
          ),
        ],
      ),
    );
  }
}
