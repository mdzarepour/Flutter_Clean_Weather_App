part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class LoadCurrentWeatherEvent extends WeatherEvent {
  final String cityName;
  const LoadCurrentWeatherEvent({required this.cityName});
}

class LoadForcastWeatherEvent extends WeatherEvent {
  final double lat;
  final double lon;
  const LoadForcastWeatherEvent({required this.lat, required this.lon});
}

class LoadCitySuggestionEvent extends WeatherEvent {
  final String prefix;
  const LoadCitySuggestionEvent({required this.prefix});
}
