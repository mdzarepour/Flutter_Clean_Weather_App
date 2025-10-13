import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class LoadCurrentWeatherUsecase implements Usecase<Future<Either>, String> {
  final WeatherRepository weatherRepository;
  LoadCurrentWeatherUsecase({required this.weatherRepository});

  @override
  Future<Either> call(String cityName) async {
    return await weatherRepository.loadCurrentWeather(cityName: cityName);
  }
}
