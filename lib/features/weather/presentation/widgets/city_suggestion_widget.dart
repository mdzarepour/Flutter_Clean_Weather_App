import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/constants/const_colors.dart';

class CitySuggestionWidget extends StatelessWidget {
  final String cityName;
  final String countryCode;
  final String country;
  const CitySuggestionWidget({
    super.key,
    required this.cityName,
    required this.countryCode,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ConstantColors.materialSecondGrey),
      ),
      child: ListTile(
        leading: Icon(Icons.location_on, size: 20),
        title: Text(cityName),
        subtitle: Text('$countryCode $country'),
      ),
    );
  }
}
