part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final CurrentWeatherStatus currentWeatherStatus;
  final ForecastWeatherStatus forecastWeatherStatus;
  const WeatherState({
    required this.currentWeatherStatus,
    required this.forecastWeatherStatus,
  });

  WeatherState copyWith({
    CurrentWeatherStatus? newCurrentWeatherStatus,
    ForecastWeatherStatus? newForecastWeatherStatus,
  }) {
    return WeatherState(
      currentWeatherStatus: newCurrentWeatherStatus ?? currentWeatherStatus,
      forecastWeatherStatus: newForecastWeatherStatus ?? forecastWeatherStatus,
    );
  }

  @override
  List<Object?> get props => [currentWeatherStatus, forecastWeatherStatus];
}
