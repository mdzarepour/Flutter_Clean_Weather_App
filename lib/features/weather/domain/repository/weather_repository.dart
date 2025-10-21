import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/utils/errors/network_exeption.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/forcast_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/suggestion_city_entity.dart';

abstract interface class WeatherRepository {
  Future<Either<NetworkExeption, CurrentWeatherEntity>> loadCurrentWeather({
    required String cityName,
  });

  Future<Either<NetworkExeption, List<ForecastWeatherEntity>>>
  loadForcastWeather({required double lat, required double lon});

  Future<List<SuggestionCityEntity>> loadCitySuggestion({
    required String prefix,
  });
}
