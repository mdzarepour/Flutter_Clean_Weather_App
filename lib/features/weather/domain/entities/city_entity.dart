import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final double lat;
  final double lon;

  final int population;
  final int id;

  final String countryCode;
  final String country;
  final String name;
  const CityEntity({
    required this.country,
    required this.countryCode,
    required this.id,
    required this.lat,
    required this.lon,
    required this.name,
    required this.population,
  });

  @override
  List<Object?> get props => [id];
}
