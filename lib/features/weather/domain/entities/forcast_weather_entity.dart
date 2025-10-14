import 'package:equatable/equatable.dart';

class ForecastWeatherEntity extends Equatable {
  final DateTime dt;
  final double temp;
  final String icon;
  final String main;
  final String description;

  const ForecastWeatherEntity({
    required this.dt,
    required this.temp,
    required this.icon,
    required this.main,
    required this.description,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
