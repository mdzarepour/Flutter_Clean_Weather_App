import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather/data/datasources/weater_datasource.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository_imp.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/city_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/current_weather_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/forcast_weather_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  locator.registerSingleton<Dio>(
    Dio(BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5/')),
  );

  // datasources -->
  locator.registerLazySingleton<WeatherDatasource>(
    () => WeatherDatasourceImp(dio: locator()),
  );

  // repositories -->
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImp(weatherDatasource: locator()),
  );

  // usecases -->
  locator.registerLazySingleton<LoadCurrentWeatherUsecase>(
    () => LoadCurrentWeatherUsecase(weatherRepository: locator()),
  );
  locator.registerLazySingleton<LoadForcastWeatherUsecase>(
    () => LoadForcastWeatherUsecase(weatherRepository: locator.get()),
  );
  locator.registerLazySingleton(
    () => LoadCitySuggestionUsecase(weatherRepository: locator.get()),
  );

  // bloc -->
  locator.registerFactory<WeatherBloc>(
    () => WeatherBloc(
      loadCurrentWeatherUsecase: locator(),
      loadForcastWeatherUsecase: locator.get(),
      loadCitySuggestionUsecase: locator.get(),
    ),
  );
}
