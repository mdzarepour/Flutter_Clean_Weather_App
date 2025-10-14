import 'package:weather_app/features/weather/domain/entities/forcast_weather_entity.dart';

class ForecastWeatherStatus {}

class FwInitialStatus extends ForecastWeatherStatus {}

class FwLoadingStatus extends ForecastWeatherStatus {}

class FwFailedStatus extends ForecastWeatherStatus {
  final String errorMessage;
  FwFailedStatus({required this.errorMessage});
}

class FwSuccesStatus extends ForecastWeatherStatus {
  final List<ForecastWeatherEntity> forecastWeatherList;
  FwSuccesStatus({required this.forecastWeatherList});
}
