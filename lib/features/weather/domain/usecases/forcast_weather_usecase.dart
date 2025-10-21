import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/core/utils/errors/network_exeption.dart';
import 'package:weather_app/features/weather/domain/entities/forcast_weather_entity.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class LoadForcastWeatherUsecase
    implements
        Usecase<
          Future<Either<NetworkExeption, List<ForecastWeatherEntity>>>,
          ForcastParams
        > {
  final WeatherRepository weatherRepository;
  LoadForcastWeatherUsecase({required this.weatherRepository});

  @override
  Future<Either<NetworkExeption, List<ForecastWeatherEntity>>> call(
    ForcastParams params,
  ) async {
    return await weatherRepository.loadForcastWeather(
      lat: params.lat,
      lon: params.lon,
    );
  }
}

class ForcastParams {
  final double lat;
  final double lon;
  ForcastParams({required this.lat, required this.lon});
}
