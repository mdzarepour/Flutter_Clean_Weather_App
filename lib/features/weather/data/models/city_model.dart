import 'package:weather_app/features/weather/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel({
    required super.country,
    required super.countryCode,
    required super.id,
    required super.lat,
    required super.lon,
    required super.name,
    required super.population,
  });

  factory CityModel.fromJson(Map<String, dynamic> map) {
    print(map['country']);
    return CityModel(
      country: map['country'],
      countryCode: map['countryCode'],
      id: map['id'],
      lat: map['latitude'],
      lon: map['longitude'],
      name: map['name'],
      population: map['population'],
    );
  }
}
