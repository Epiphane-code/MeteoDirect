import 'package:directmeteo/models/meteodata.dart';
import 'package:directmeteo/utils/utils.dart';
import 'package:directmeteo/widgets/iconMeteo.dart';
import 'package:directmeteo/widgets/meteo_grid.dart';
import 'package:flutter/material.dart';

Widget DetailCard(Meteodata data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      spacing: 15,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white24,
            border: Border.all(color: Colors.white38),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 20),
                    Text(
                      ' ${data.cityName}, ${data.country}, ${data.temperature}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
          
                Text(
                  DateformatFr(data.sunrise),
                  style: TextStyle(color: Colors.white54),
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    IconMeteo(data.iconCode),
                    Column(
                      children: [
                        Text(
                          TemperatureToC(data.temperature),
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Text(
                          'Ressenti ${TemperatureToC(data.feelsLike)}',
                          style: TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 14),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    data.description,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
          
                const SizedBox(height: 10),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.device_thermostat, color: Colors.lightBlueAccent),
                        Text('Min', style: TextStyle(color: Colors.white54),),
                        const SizedBox(width: 4),
          
                        Text(
                          TemperatureToC(data.tempMin),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                     Row(
        
                      children: [
                        const Icon(Icons.device_thermostat, color: Colors.orange),
                        Text('Max', style: TextStyle(color: Colors.white54),),
                        const SizedBox(width: 4),
          
                        Text(
                          TemperatureToC(data.tempMax),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
          
          
              
              ],
            ),
          ),
        ),
            SizedBox(child: MyGridView(data: data))
      ],
    ),
  );
}
