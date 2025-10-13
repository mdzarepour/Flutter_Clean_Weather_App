import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/forcast_weather_entity.dart';
import 'package:weather_app/features/weather/domain/usecases/current_weather_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/forcast_weather_usecase.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final LoadCurrentWeatherUsecase loadCurrentWeatherUsecase;
  final LoadForcastWeatherUsecase loadForcastWeatherUsecase;

  WeatherBloc({
    required this.loadCurrentWeatherUsecase,
    required this.loadForcastWeatherUsecase,
  }) : super(WeatherInitialState()) {
    on<LoadCurrentWeatherEvent>((event, emit) async {
      emit(CurrentWeatherLoadingState());
      Either either = await loadCurrentWeatherUsecase.call(event.cityName);
      either.fold(
        (exeption) {
          emit(CurrentWeatherFailedState(errorMessage: exeption.message));
        },
        (currentWeatherEntity) {
          emit(
            CurrentWeatherCompletedState(
              currentWeatherEntity: currentWeatherEntity,
            ),
          );
        },
      );
    });
    on<LoadForcastWeatherEvent>((event, emit) async {
      emit(ForecastWeatherLoadingState());
      final Either either = await loadForcastWeatherUsecase.call(
        ForcastParams(lat: event.lat, lon: event.lon),
      );
      either.fold(
        (exeption) {
          emit(ForecastWeatherFailedState(errorMessage: exeption.message));
        },
        (forecastWeatherLst) {
          emit(
            ForecastWeatherCompletedState(
              forcastWeatherList: forecastWeatherLst,
            ),
          );
        },
      );
    });
  }
}
