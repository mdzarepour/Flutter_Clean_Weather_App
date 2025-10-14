import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/theme/app_text_theme.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const InfoWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
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
          Icon(icon, size: 35),
          Text(style: AppTextTheme.white15medium, value),
        ],
      ),
    );
  }
}
