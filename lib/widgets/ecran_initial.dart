import 'package:flutter/material.dart';

Widget EcranInitial() {
  return SizedBox(
    height: 300,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Icon(Icons.public, color: Colors.greenAccent, size: 70,),
            ),
          ),
          const Text(
            'Recherchez une ville',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const Text(
            'Pour obtenir la meteo du temps reel',
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
