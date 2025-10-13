import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/errors/network_exeption.dart';
import 'package:weather_app/features/weather/data/datasources/weater_datasource.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/forcast_weather_model.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/forcast_weather_entity.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImp implements WeatherRepository {
  final WeatherDatasource weatherDatasource;

  WeatherRepositoryImp({required this.weatherDatasource});

  @override
  Future<Either<NetworkExeption, CurrentWeatherEntity>> loadCurrentWeather({
    required String cityName,
  }) async {
    try {
      final Response response = await weatherDatasource.loadCurrentWeather(
        cityName: cityName,
      );

      if (response.statusCode == 200) {
        final CurrentWeatherEntity currentWeatherEntity =
            CurrentWeatherModel.fromJson(response.data);
        return right(currentWeatherEntity);
      } else {
        return left(
          NetworkExeption(
            'Bad status code: ${response.statusCode}',
            'weather_repository_imp.dart',
            response.statusCode,
          ),
        );
      }
    } on NetworkExeption catch (e) {
      return left(e);
    } catch (e) {
      return left(NetworkExeption(e.toString(), 'weather_repository_imp.dart'));
    }
  }

  @override
  Future<Either<NetworkExeption, List<ForcastWeatherEntity>>>
  loadForcastWeather({required double lat, required double lon}) async {
    try {
      final Response response = await weatherDatasource.loadForecastWeather(
        lat: lat,
        lon: lon,
      );
      if (response.statusCode == 200) {
        final List<dynamic> list = response.data['list'];
        final List<ForcastWeatherEntity> forecastList = list
            .map((item) => ForcastWeatherModel.fromJson(map: item))
            .toList();
        print(response.data);
        print(forecastList.length);
        return right(forecastList);
      } else {
        return left(
          NetworkExeption(
            'Bad status code: ${response.statusCode}',
            'weather_repository_imp.dart',
            response.statusCode,
          ),
        );
      }
    } on NetworkExeption catch (e) {
      return left(e);
    } catch (e) {
      return left(NetworkExeption(e.toString(), 'weather_repository_imp.dart'));
    }
  }
}
