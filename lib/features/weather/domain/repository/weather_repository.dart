import 'package:fpdart/fpdart.dart';
import 'package:weather_app/features/weather/domain/entities/city_entity.dart';

abstract interface class WeatherRepository {
  Future<Either> loadCurrentWeather({required String cityName});
  Future<Either> loadForcastWeather({required double lat, required double lon});
  Future<List<CityEntity>> loadCitySuggestion({required String prefix});
}
