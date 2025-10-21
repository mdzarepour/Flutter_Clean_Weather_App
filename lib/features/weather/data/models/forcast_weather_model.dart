import 'package:weather_app/features/weather/domain/entities/forcast_weather_entity.dart';

class ForcastWeatherModel extends ForecastWeatherEntity {
  const ForcastWeatherModel({
    required super.dt,
    required super.temp,
    required super.icon,
  });

  factory ForcastWeatherModel.fromJson({required Map<String, dynamic> map}) {
    return ForcastWeatherModel(
      dt: DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
      temp: (map['main']['temp'] as num).toDouble(),
      icon: map['weather'][0]['icon'],
    );
  }

  ForecastWeatherEntity toEntity() {
    return ForecastWeatherEntity(dt: dt, temp: temp, icon: icon);
  }
}
