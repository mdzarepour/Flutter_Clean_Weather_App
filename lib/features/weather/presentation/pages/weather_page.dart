import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_app/core/utils/constants/const_colors.dart';
import 'package:weather_app/core/utils/formatters/date_formatter.dart';
import 'package:weather_app/core/utils/mappers/weather_icon_mapper.dart';
import 'package:weather_app/core/utils/theme/app_text_theme.dart';
import 'package:weather_app/features/weather/domain/entities/forcast_weather_entity.dart';
import 'package:weather_app/features/weather/domain/usecases/city_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/status/current_weather_status.dart';
import 'package:weather_app/features/weather/presentation/bloc/status/forecast_weather_status.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/widgets/city_suggestion_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/info_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/temp_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/forecast_widget.dart';
import 'package:weather_app/locator.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool isBookmarked = false;
  final LoadCitySuggestionUsecase loadCitySuggestionUsecase = locator.get();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSearchUi(context),
          _buildCurrentWeatherUi(),
          _buildForecastWeatherUi(),
        ],
      ),
    );
  }

  Widget _buildForecastWeatherUi() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final status = state.forecastWeatherStatus;
        if (status is FwLoadingStatus) {
          return Center(child: CircularProgressIndicator());
        }
        if (status is FwFailedStatus) {
          return Center(
            child: Text(status.errorMessage, style: AppTextTheme.white15medium),
          );
        }
        if (status is FwSuccesStatus) {
          final List<ForecastWeatherEntity> forecastWeatherList =
              status.forecastWeatherList;
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: forecastWeatherList.length,
              itemBuilder: (context, index) {
                return ForecastWidget(
                  title: getDayOfWeek(forecastWeatherList[index].dt),
                  value: getTimeOfDay(forecastWeatherList[index].dt),
                  iconPath: getIconPath(forecastWeatherList[index].icon),
                );
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildCurrentWeatherUi() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final status = state.currentWeatherStatus;
        if (status is CwInitialStatus) {
          return Column(
            spacing: 10,
            children: [
              Icon(Icons.place),
              Text(
                style: AppTextTheme.white15medium,
                'please search city first ..',
              ),
            ],
          );
        }
        if (status is CwLoadingStatus) {
          return const Center(child: CircularProgressIndicator());
        }
        if (status is CwFailedStatus) {
          return Center(
            child: Text(
              maxLines: 3,
              textAlign: TextAlign.center,
              status.errorMessage,
              style: AppTextTheme.white15medium,
            ),
          );
        }
        if (status is CwSuccessStatus) {
          final currentWeatherEntity = status.currentWeatherEntity;
          return Column(
            children: [
              const SizedBox(height: 20),
              Row(
                spacing: 30,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        currentWeatherEntity.cityName,
                        textAlign: TextAlign.center,
                        style: AppTextTheme.white25bold,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        currentWeatherEntity.description,
                        textAlign: TextAlign.center,
                        style: AppTextTheme.grey20medium,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(getIconPath(currentWeatherEntity.icon)),
                  const SizedBox(width: 20),
                  Text(
                    currentWeatherEntity.temp.toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: AppTextTheme.white50bold,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TempWidget(
                    title: 'max',
                    temp: currentWeatherEntity.tempMax.toStringAsFixed(2),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: ConstantColors.materialSecondGrey,
                  ),
                  TempWidget(
                    title: 'min',
                    temp: currentWeatherEntity.tempMin.toStringAsFixed(2),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoWidget(
                    title: 'humidity',
                    value: currentWeatherEntity.humidity.toStringAsFixed(2),
                    icon: Icons.water_drop,
                  ),
                  InfoWidget(
                    title: 'wind speed',
                    value: currentWeatherEntity.windSpeed.toStringAsFixed(2),
                    icon: Icons.wind_power,
                  ),
                  InfoWidget(
                    title: 'feels like',
                    value: currentWeatherEntity.feelsLike.toStringAsFixed(2),
                    icon: Icons.beach_access,
                  ),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSearchUi(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: ConstantColors.materialFirstGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: TypeAheadField(
        builder: (context, controller, focusNode) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: ConstantColors.materialWhite,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          );
        },
        suggestionsCallback: (String prefix) async {
          return await loadCitySuggestionUsecase.call(prefix);
        },
        itemBuilder: (BuildContext context, city) {
          return CitySuggestionWidget(
            cityName: city.name,
            countryCode: city.countryCode,
            country: city.country,
          );
        },
        onSelected: (city) {
          context.read<WeatherBloc>().add(
            LoadCurrentWeatherEvent(cityName: city.name),
          );
          context.read<WeatherBloc>().add(
            LoadForcastWeatherEvent(lat: city.lat, lon: city.lon),
          );
        },
      ),
    );
  }
}
