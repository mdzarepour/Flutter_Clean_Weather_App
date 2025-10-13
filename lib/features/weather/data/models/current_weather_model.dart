import 'package:weather_app/features/weather/domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  const CurrentWeatherModel({
    required super.description,
    required super.main,
    required super.feelsLike,
    required super.temp,
    required super.tempMax,
    required super.tempMin,
    required super.humidity,
    required super.windSpeed,
    required super.cityId,
    required super.country,
    required super.weatherId,
    required super.cityName,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> map) {
    return CurrentWeatherModel(
      cityId: map['id'] as int,
      weatherId: (map['weather'][0]['id'] as int),
      temp: (map['main']['temp'] as num).toDouble(),
      feelsLike: (map['main']['feels_like'] as num).toDouble(),
      tempMin: (map['main']['temp_min'] as num).toDouble(),
      tempMax: (map['main']['temp_max'] as num).toDouble(),
      humidity: (map['main']['humidity'] as num).toDouble(),
      windSpeed: (map['wind']['speed'] as num).toDouble(),
      main: map['weather'][0]['main'] as String,
      description: map['weather'][0]['description'] as String,
      country: map['sys']['country'] as String,
      cityName: map['name'] as String,
    );
  }
}
