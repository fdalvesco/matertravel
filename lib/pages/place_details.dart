import 'package:flutter/material.dart';
import 'city.dart'; // Importa a classe City
import '../src/models/appdata.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailsPage extends StatefulWidget {
  final City place;

  const PlaceDetailsPage({required this.place, Key? key}) : super(key: key);

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = AppData.isFavorite(widget.place);
  }

  void _toggleFavorite() {
    setState(() {
      if (isFavorite) {
        AppData.removeFavorite(widget.place);
      } else {
        AppData.addFavorite(widget.place);
      }
      isFavorite = !isFavorite;
    });
  }

  void _launchMaps() async {
    final lat = widget.place.latitude;
    final lng = widget.place.longitude;
    final url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$lat,$lng');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o mapa')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final place = widget.place;

    return Scaffold(
      appBar: AppBar(
        title: Text(place.placeName),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: _toggleFavorite,
            color: isFavorite ? Colors.red : null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(place.imagePath, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              place.placeName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              place.city,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Text(place.description),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.directions),
                label: const Text('Como chegar'),
                onPressed: _launchMaps,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
