class CurrentWeatherEntity {
  final int id;
  final int weatherId;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double humidity;
  final double windSpeed;
  final String main;
  final String description;
  final String country;
  final String cityName;
  final String icon;

  final double lat;
  final double lon;

  const CurrentWeatherEntity({
    required this.id,
    required this.weatherId,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.windSpeed,
    required this.main,
    required this.description,
    required this.country,
    required this.cityName,
    required this.icon,
    required this.lat,
    required this.lon,
  });
}
