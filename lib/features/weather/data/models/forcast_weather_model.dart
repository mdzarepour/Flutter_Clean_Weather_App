import 'package:weather_app/features/weather/domain/entities/forcast_weather_entity.dart';

class ForcastWeatherModel extends ForcastWeatherEntity {
  const ForcastWeatherModel({
    required super.dt,
    required super.temp,
    required super.icon,
    required super.main,
    required super.description,
  });

  factory ForcastWeatherModel.fromJson({required Map<String, dynamic> map}) {
    return ForcastWeatherModel(
      dt: DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
      temp: (map['main']['temp'] as num).toDouble(),
      icon: map['weather'][0]['icon'],
      main: map['weather'][0]['main'],
      description: map['weather'][0]['description'],
    );
  }
}
