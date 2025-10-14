import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/core/utils/errors/network_exeption.dart';
import 'package:weather_app/features/weather/domain/entities/city_entity.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class LoadCitySuggestionUsecase
    implements Usecase<Future<List<CityEntity>>, String> {
  final WeatherRepository weatherRepository;
  LoadCitySuggestionUsecase({required this.weatherRepository});

  @override
  Future<List<CityEntity>> call(String prefix) async {
    return await weatherRepository.loadCitySuggestion(prefix: prefix);
  }
}
