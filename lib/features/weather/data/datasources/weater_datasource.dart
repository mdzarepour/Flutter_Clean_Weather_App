import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/constants/const_secrets.dart';
import 'package:weather_app/core/utils/errors/network_exeption.dart';

abstract interface class WeatherDatasource {
  Future<Response> loadCurrentWeather({required String cityName});
  Future<Response> loadForecastWeather({
    required double lat,
    required double lon,
  });
  Future<Response> loadCitySuggestion({required String prefix});
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

  @override
  Future<Response> loadCitySuggestion({required String prefix}) async {
    try {
      var response = await dio.get(
        "http://geodb-free-service.wirefreethought.com/v1/geo/cities",
        queryParameters: {'limit': 7, 'offset': 0, 'namePrefix': prefix},
      );
      return response;
    } on DioException catch (e) {
      throw NetworkExeption(
        e.message,
        'weather_datasource.dart (loadCitySuggestion)',
        e.response!.statusCode,
      );
    }
  }
}
