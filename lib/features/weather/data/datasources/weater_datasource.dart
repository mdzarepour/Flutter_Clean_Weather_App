import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/const_secrets.dart';
import 'package:weather_app/core/errors/network_exeption.dart';

abstract interface class WeatherDatasource {
  Future<Response> loadCurrentWeather({required String cityName});
  Future<Response> loadForecastWeather({
    required double lat,
    required double lon,
  });
}

class WeatherDatasourceImp implements WeatherDatasource {
  final Dio dio;

  WeatherDatasourceImp({required this.dio});

  @override
  Future<Response> loadCurrentWeather({required String cityName}) async {
    try {
      final Response response = await dio.get(
        'weather',
        queryParameters: {
          'q': cityName,
          'appid': ConstSecrets.apiKey,
          'units': 'metric',
        },
      );
      return response;
    } on DioException catch (e) {
      throw NetworkExeption(
        e.message,
        'weather_datasource.dart (loadCurrentWeather)',
        e.response?.statusCode,
      );
    }
  }

  @override
  Future<Response> loadForecastWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final Response response = await dio.get(
        'forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': ConstSecrets.apiKey,
          'units': 'metric',
        },
      );
      return response;
    } on DioException catch (e) {
      throw NetworkExeption(
        e.message,
        'weather_datasource.dart (loadForecastWeather)',
        e.response?.statusCode,
      );
    }
  }
}
