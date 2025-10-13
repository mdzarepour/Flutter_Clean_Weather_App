import 'package:fpdart/fpdart.dart';

abstract interface class WeatherRepository {
  Future<Either> loadCurrentWeather({required String cityName});
  Future<Either> loadForcastWeather({required double lat, required double lon});
}
