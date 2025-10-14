import 'package:equatable/equatable.dart';

class CurrentWeatherEntity extends Equatable {
  final int cityId;
  final int weatherId;

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double humidity;
  final double windSpeed;

  final String country;
  final String cityName;
  final String main;
  final String description;
  final String icon;

  const CurrentWeatherEntity({
    required this.icon,
    required this.description,
    required this.main,
    required this.feelsLike,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.humidity,
    required this.windSpeed,
    required this.cityId,
    required this.country,
    required this.weatherId,
    required this.cityName,
  });

  @override
  List<Object?> get props => [cityId, weatherId, cityName];
}
