
class Meteodata {
  final String cityName;
  final String country;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final int windDegree;
  final String description;
  final String iconCode;
  final int visibility;
  final DateTime sunrise;
  final DateTime sunset;

  Meteodata({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDegree,
    required this.description,
    required this.iconCode,
    required this.visibility,
    required this.sunrise,
    required this.sunset,
  });

  factory Meteodata.fromJson(Map<String, dynamic> map) {
    return Meteodata(
      cityName: map['name'],
      country: map['sys']['country'],

      temperature: (map['main']['temp'] as num).toDouble(),
      feelsLike: (map['main']['feels_like'] as num).toDouble(),
      tempMin: (map['main']['temp_min'] as num).toDouble(),
      tempMax: (map['main']['temp_max'] as num).toDouble(),

      humidity: map['main']['humidity'],
      pressure: map['main']['pressure'],

      windSpeed: (map['wind']['speed'] as num).toDouble(),
      windDegree: map['wind']['deg'],

      description: map['weather'][0]['description'],
      iconCode: map['weather'][0]['icon'],

      visibility: map['visibility'],

      sunrise: DateTime.fromMillisecondsSinceEpoch(
        map['sys']['sunrise'] * 1000,
      ),

      sunset: DateTime.fromMillisecondsSinceEpoch(
        map['sys']['sunset'] * 1000,
      ),
    );
  }
}
