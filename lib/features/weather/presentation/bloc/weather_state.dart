part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class CurrentWeatherLoadingState extends WeatherState {}

class CurrentWeatherCompletedState extends WeatherState {
  final CurrentWeatherEntity currentWeatherEntity;
  const CurrentWeatherCompletedState({required this.currentWeatherEntity});
}

class CurrentWeatherFailedState extends WeatherState {
  final String errorMessage;
  const CurrentWeatherFailedState({required this.errorMessage});
}

// forecast state -->
class ForecastWeatherLoadingState extends WeatherState {}

class ForecastWeatherCompletedState extends WeatherState {
  final List<ForcastWeatherEntity> forcastWeatherList;
  const ForecastWeatherCompletedState({required this.forcastWeatherList});
}

class ForecastWeatherFailedState extends WeatherState {
  final String errorMessage;
  const ForecastWeatherFailedState({required this.errorMessage});
}
