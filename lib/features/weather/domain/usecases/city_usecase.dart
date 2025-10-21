import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/suggestion_city_entity.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class LoadCitySuggestionUsecase
    implements Usecase<Future<List<SuggestionCityEntity>>, String> {
  final WeatherRepository weatherRepository;
  LoadCitySuggestionUsecase({required this.weatherRepository});

  @override
  Future<List<SuggestionCityEntity>> call(String prefix) async {
    return await weatherRepository.loadCitySuggestion(prefix: prefix);
  }
}
