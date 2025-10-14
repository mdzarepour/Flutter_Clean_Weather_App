import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/theme/app_text_theme.dart';

class ForecastWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData? iconPath;
  const ForecastWidget({
    super.key,
    required this.title,
    required this.value,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text(style: AppTextTheme.grey15medium, title),
          Icon(iconPath, size: 25),
          Text(style: AppTextTheme.white15medium, value),
        ],
      ),
    );
  }
}
