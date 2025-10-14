import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/theme/app_text_theme.dart';

class TempWidget extends StatelessWidget {
  final String title;
  final String temp;
  const TempWidget({super.key, required this.title, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(style: AppTextTheme.grey20medium, title),
        Text(style: AppTextTheme.white20medium, temp),
      ],
    );
  }
}
