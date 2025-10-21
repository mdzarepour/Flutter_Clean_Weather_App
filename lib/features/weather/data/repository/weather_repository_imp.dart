import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/utils/errors/network_exeption.dart';
import 'package:weather_app/features/weather/data/datasources/weater_datasource.dart';
import 'package:weather_app/features/weather/data/models/suggestion_city_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/forcast_weather_model.dart';
import 'package:weather_app/features/weather/domain/entities/suggestion_city_entity.dart';
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
        final CurrentWeatherModel currentWeatherModel =
            CurrentWeatherModel.fromJson(response.data);
        return right(currentWeatherModel.toEntity());
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
  Future<Either<NetworkExeption, List<ForecastWeatherEntity>>>
  loadForcastWeather({required double lat, required double lon}) async {
    try {
      final Response response = await weatherDatasource.loadForecastWeather(
        lat: lat,
        lon: lon,
      );
      if (response.statusCode == 200) {
        final List<ForecastWeatherEntity> forecastList = response.data['list']
            .map<ForecastWeatherEntity>(
              (e) => ForcastWeatherModel.fromJson(map: e).toEntity(),
            )
            .toList();
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

  @override
  Future<List<SuggestionCityEntity>> loadCitySuggestion({
    required String prefix,
  }) async {
    try {
      final Response response = await weatherDatasource.loadCitySuggestion(
        prefix: prefix,
      );
      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data['data'];
        final List<SuggestionCityEntity> cityList = dataList
            .map(
              (e) => SuggestionCityModel.fromJson(
                e as Map<String, dynamic>,
              ).toEntity(),
            )
            .toList();
        return cityList;
      } else {
        throw NetworkExeption(
          'Bad status code: ${response.statusCode}',
          'weather_repository_imp.dart',
          response.statusCode,
        );
      }
    } on NetworkExeption catch (e) {
      throw e.message!;
    } catch (e) {
      throw NetworkExeption(e.toString(), 'weather_repository_imp.dart');
    }
  }
}
