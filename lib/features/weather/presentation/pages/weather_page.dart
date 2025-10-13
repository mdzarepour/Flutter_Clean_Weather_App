import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/const_colors.dart';
import 'package:weather_app/core/theme/app_text_theme.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/forcast_weather_entity.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/widgets/divider_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/temp_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/week_day_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    BlocProvider.of<WeatherBloc>(
      context,
    ).add(LoadForcastWeatherEvent(lat: 35.6892, lon: 51.3890));

    BlocProvider.of<WeatherBloc>(
      context,
    ).add(LoadCurrentWeatherEvent(cityName: 'tehran'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildCurrentWeatherUi(),
          DividerWidget(),
          _buildForecastWeatherUi(),
          Spacer(),
        ],
      ),
    );
  }

  Expanded _buildCurrentWeatherUi() {
    return Expanded(
      flex: 10,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is CurrentWeatherLoadingState) {
            return CircularProgressIndicator();
          }
          if (state is CurrentWeatherFailedState) {
            return Text(state.errorMessage);
          }
          if (state is CurrentWeatherCompletedState) {
            final CurrentWeatherEntity currentWeather =
                state.currentWeatherEntity;
            return Column(
              children: [
                SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                    color: ConstantColors.materialFirstGrey,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: ConstantColors.materialWhite,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  style: AppTextTheme.white25bold,
                  currentWeather.cityName,
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  style: AppTextTheme.grey20medium,
                  currentWeather.description,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sunny),
                    SizedBox(width: 20),
                    Text(
                      textAlign: TextAlign.center,
                      currentWeather.temp.toStringAsFixed(2),
                      style: AppTextTheme.white50bold,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TempWidget(
                      title: 'max',
                      temp: currentWeather.tempMax.toStringAsFixed(2),
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: ConstantColors.materialSecondGrey,
                    ),
                    TempWidget(
                      title: 'min',
                      temp: currentWeather.tempMin.toStringAsFixed(2),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoWidget(
                      title: 'humidity',
                      value: currentWeather.humidity.toStringAsFixed(2),
                      icon: Icons.water_drop,
                    ),
                    InfoWidget(
                      title: 'wind speed',
                      value: currentWeather.windSpeed.toStringAsFixed(2),
                      icon: Icons.wind_power,
                    ),
                    InfoWidget(
                      title: 'feels like',
                      value: currentWeather.feelsLike.toStringAsFixed(2),
                      icon: Icons.beach_access,
                    ),
                  ],
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildForecastWeatherUi() {
    return Expanded(
      flex: 2,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is ForecastWeatherLoadingState) {
            return CircularProgressIndicator();
          }
          if (state is ForecastWeatherFailedState) {
            return Text(state.errorMessage);
          }
          if (state is ForecastWeatherCompletedState) {
            final List<ForcastWeatherEntity> forecastWeatherList =
                state.forcastWeatherList;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: forecastWeatherList.length,
              itemBuilder: (context, index) {
                return InfoWidget(
                  title: forecastWeatherList[index].dt.toString(),
                  value: forecastWeatherList[index].temp.toStringAsFixed(2),
                  icon: Icons.ac_unit,
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
