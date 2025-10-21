import 'package:equatable/equatable.dart';

class ForecastWeatherEntity extends Equatable {
  final DateTime dt;
  final double temp;
  final String icon;

  const ForecastWeatherEntity({
    required this.dt,
    required this.temp,
    required this.icon,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
