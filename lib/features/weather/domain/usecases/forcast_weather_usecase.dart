import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class LoadForcastWeatherUsecase
    implements Usecase<Future<Either>, ForcastParams> {
  final WeatherRepository weatherRepository;
  LoadForcastWeatherUsecase({required this.weatherRepository});

  @override
  Future<Either> call(ForcastParams params) async {
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
