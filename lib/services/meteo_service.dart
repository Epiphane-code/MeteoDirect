import 'dart:convert';

import 'package:http/http.dart' as http;

class MeteoService {
  final String apiKEY = '02b3b1abcde6481f2d146880ae91ea8b';

  Future<Map<String, dynamic>> getMeteo(String city) async {
    final Uri uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather'
      '?q=$city'
      '&appid=$apiKEY'
      '&units=metric'
      '&lang=fr',
    );
    try {
      final reponse = await http.get(
        uri,
        headers: {'Accept': 'application/json'},
      );

      switch (reponse.statusCode) {
        case 200:
          return jsonDecode(reponse.body);

        case 401:
          throw Exception('Clé API invalide. Vérifiez votre configuration.');

        case 404:
          throw Exception('Ville $city introuvable. Vérifiez l’orthographe.');

        case 429:
          throw Exception('Limite de requêtes atteinte. Réessayez plus tard.');

        default:
          throw Exception('Erreur serveur : ${reponse.statusCode}');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('Erreur réseau : connexion, DNS, etc.');
    }
  }
}
