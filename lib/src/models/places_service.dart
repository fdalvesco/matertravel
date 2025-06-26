import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacesService {
  static const String _apiKey = 'AIzaSyDKIp_Ycthv_XjVRe4NmuRnI_Dzu28VfMg';

  static Future<List> buscarPontosTuristicos(double lat, double lon) async {
    final url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
        '?location=$lat,$lon'
        '&radius=5000'
        '&type=tourist_attraction'
        '&key=$_apiKey';

    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      return json['results'];
    } else {
      throw Exception('Erro ao buscar pontos: ${res.statusCode}');
    }
  }
}
