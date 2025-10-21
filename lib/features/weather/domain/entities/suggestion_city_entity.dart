import 'package:equatable/equatable.dart';

class SuggestionCityEntity extends Equatable {
  final double lat;
  final double lon;

  final int id;

  final String countryCode;
  final String country;
  final String name;
  const SuggestionCityEntity({
    required this.country,
    required this.countryCode,
    required this.id,
    required this.lat,
    required this.lon,
    required this.name,
  });

  @override
  List<Object?> get props => [id];
}
