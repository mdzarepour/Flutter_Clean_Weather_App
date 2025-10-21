import 'package:weather_app/features/weather/domain/entities/suggestion_city_entity.dart';

class SuggestionCityModel extends SuggestionCityEntity {
  const SuggestionCityModel({
    required super.country,
    required super.countryCode,
    required super.id,
    required super.lat,
    required super.lon,
    required super.name,
  });

  factory SuggestionCityModel.fromJson(Map<String, dynamic> map) {
    return SuggestionCityModel(
      country: map['country'],
      countryCode: map['countryCode'],
      id: map['id'],
      lat: map['latitude'],
      lon: map['longitude'],
      name: map['name'],
    );
  }

  SuggestionCityEntity toEntity() {
    return SuggestionCityEntity(
      country: country,
      countryCode: countryCode,
      id: id,
      lat: lat,
      lon: lon,
      name: name,
    );
  }
}
