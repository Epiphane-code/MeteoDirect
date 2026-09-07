import 'package:flutter/material.dart';

Widget IconMeteo(String iconCode) {
  switch (iconCode) {
    // ☀️ Ciel dégagé - Jour
    case '01d':
      return const Icon(
        Icons.sunny,
        color: Colors.yellow,
        size: 40,
      );

    // 🌙 Ciel dégagé - Nuit
    case '01n':
      return const Icon(
        Icons.nightlight_round,
        color: Colors.white,
        size: 40,
      );

    // 🌤️ Quelques nuages - Jour
    case '02d':
      return SizedBox(
        width: 45,
        height: 45,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              right: 0,
              child: Icon(
                Icons.sunny,
                color: Colors.yellow,
                size: 30,
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              child: Icon(
                Icons.cloud,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        ),
      );

    // 🌥️ Quelques nuages - Nuit
    case '02n':
      return SizedBox(
        width: 45,
        height: 45,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              right: 0,
              child: Icon(
                Icons.nightlight_round,
                color: Colors.white,
                size: 28,
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              child: Icon(
                Icons.cloud,
                color: Colors.white70,
                size: 35,
              ),
            ),
          ],
        ),
      );

    // ☁️ Nuages dispersés
    case '03d':
    case '03n':
      return const Icon(
        Icons.cloud,
        color: Colors.white,
        size: 40,
      );

    // ☁️ Ciel couvert
    case '04d':
    case '04n':
      return const Icon(
        Icons.cloud,
        color: Colors.grey,
        size: 40,
      );

    // 🌦️ Averses / pluie légère
    case '09d':
    case '09n':
      return const Icon(
        Icons.grain,
        color: Colors.lightBlueAccent,
        size: 40,
      );

    // 🌧️ Pluie
    case '10d':
    case '10n':
      return const Icon(
        Icons.water_drop,
        color: Colors.lightBlueAccent,
        size: 40,
      );

    // ⛈️ Orage
    case '11d':
    case '11n':
      return const Icon(
        Icons.thunderstorm,
        color: Colors.amber,
        size: 40,
      );

    // ❄️ Neige
    case '13d':
    case '13n':
      return const Icon(
        Icons.ac_unit,
        color: Colors.white,
        size: 40,
      );

    // 🌫️ Brouillard
    case '50d':
    case '50n':
      return const Icon(
        Icons.foggy,
        color: Colors.white70,
        size: 40,
      );

    // ❓ Code inconnu
    default:
      return const Icon(
        Icons.cloud,
        color: Colors.white,
        size: 40,
      );
  }
}