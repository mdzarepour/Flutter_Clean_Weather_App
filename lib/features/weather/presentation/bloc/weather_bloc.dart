import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/features/weather/domain/usecases/current_weather_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/forcast_weather_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/status/current_weather_status.dart';
import 'package:weather_app/features/weather/presentation/bloc/status/forecast_weather_status.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final LoadCurrentWeatherUsecase loadCurrentWeatherUsecase;
  final LoadForcastWeatherUsecase loadForcastWeatherUsecase;

  WeatherBloc({
    required this.loadCurrentWeatherUsecase,
    required this.loadForcastWeatherUsecase,
  }) : super(
         WeatherState(
           currentWeatherStatus: CwInitialStatus(),
           forecastWeatherStatus: FwInitialStatus(),
         ),
       ) {
    on<LoadCurrentWeatherEvent>(loadCurrentWeather);
    on<LoadForcastWeatherEvent>(loadForecastWeather);
  }

  FutureOr<void> loadCurrentWeather(event, emit) async {
    emit(state.copyWith(newCurrentWeatherStatus: CwLoadingStatus()));
    final Either either = await loadCurrentWeatherUsecase.call(event.cityName);
    either.fold(
      (exeption) {
        emit(
          state.copyWith(
            newCurrentWeatherStatus: CwFailedStatus(
              errorMessage: exeption.message,
            ),
          ),
        );
      },
      (currentWeatherEntity) {
        emit(
          state.copyWith(
            newCurrentWeatherStatus: CwSuccessStatus(
              currentWeatherEntity: currentWeatherEntity,
            ),
          ),
        );
      },
    );
  }

  FutureOr<void> loadForecastWeather(event, emit) async {
    emit(state.copyWith(newForecastWeatherStatus: FwLoadingStatus()));
    final Either either = await loadForcastWeatherUsecase.call(
      ForcastParams(lat: event.lat, lon: event.lon),
    );
    either.fold(
      (exeption) {
        emit(
          state.copyWith(
            newForecastWeatherStatus: FwFailedStatus(
              errorMessage: exeption.message,
            ),
          ),
        );
      },
      (forecastWeatherList) {
        emit(
          state.copyWith(
            newForecastWeatherStatus: FwSuccesStatus(
              forecastWeatherList: forecastWeatherList,
            ),
          ),
        );
      },
    );
  }
}
