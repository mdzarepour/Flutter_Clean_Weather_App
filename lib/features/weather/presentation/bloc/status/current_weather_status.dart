import 'package:flutter/widgets.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather_entity.dart';

@immutable
abstract class CurrentWeatherStatus {}

class CwInitialStatus extends CurrentWeatherStatus {}

class CwLoadingStatus extends CurrentWeatherStatus {}

class CwSuccessStatus extends CurrentWeatherStatus {
  final CurrentWeatherEntity currentWeatherEntity;
  CwSuccessStatus({required this.currentWeatherEntity});
}

class CwFailedStatus extends CurrentWeatherStatus {
  final String errorMessage;
  CwFailedStatus({required this.errorMessage});
}
