import 'package:directmeteo/models/meteodata.dart';
import 'package:directmeteo/services/meteo_service.dart';
import 'package:flutter/material.dart';

enum StatutRequete { initial, isloading, success, error }

class MeteoController extends ChangeNotifier {
  Meteodata? _meteo;

  Meteodata? get meteo => _meteo;

  StatutRequete _statut = StatutRequete.initial;
  List<String> _searchHistory = [];
  List<String> get searchHistory => _searchHistory;

  String textError = '';

  bool get initial => _statut == StatutRequete.initial;
  bool get isloading => _statut == StatutRequete.isloading;
  bool get success => _statut == StatutRequete.success;
  bool get error => _statut == StatutRequete.error;

  Future<void> getMeteo(String cityName) async {
    // 1. La requête commence
    _statut = StatutRequete.isloading;
    textError = '';
    if (_searchHistory.contains(cityName)) {
      _searchHistory.remove(cityName);
    }
    if (_searchHistory.length > 4) {
      _searchHistory.removeAt(0);
    }
    _searchHistory.add(cityName);

    notifyListeners();

    final serviceMeteo = MeteoService();

    try {
      // 2. Appel de l'API
      final Map<String, dynamic>? data = await serviceMeteo
          .getMeteo(cityName)
          .timeout(const Duration(seconds: 10));

      // 3. Vérification des données
      if (data != null && data.isNotEmpty) {
        _meteo = Meteodata.fromJson(data);

        _statut = StatutRequete.success;
      } else {
        _statut = StatutRequete.error;
        textError = 'Aucune donnée météo trouvée';
      }
    } catch (e) {
      // 4. Une erreur est survenue
      textError = e.toString();

      _statut = StatutRequete.error;
    } finally {
      // 5. Mise à jour de l'interface
      notifyListeners();
    }
  }
}
