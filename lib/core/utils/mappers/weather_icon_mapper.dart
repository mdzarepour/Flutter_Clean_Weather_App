import 'package:flutter/material.dart';

IconData? getIconPath(final String iconCode) {
  final iconMap = {
    // Clear sky -->
    '01d': Icons.wb_sunny,
    '01n': Icons.nightlight_round,
    // Few clouds -->
    '02d': Icons.cloud_queue,
    '02n': Icons.cloud_queue,
    // Scattered clouds -->
    '03d': Icons.cloud,
    '03n': Icons.cloud,
    // Broken clouds -->
    '04d': Icons.cloud,
    '04n': Icons.cloud,
    // Shower rain -->
    '09d': Icons.grain,
    '09n': Icons.grain,
    // Rain -->
    '10d': Icons.beach_access,
    '10n': Icons.beach_access,
    // Thunderstorm -->
    '11d': Icons.flash_on,
    '11n': Icons.flash_on,
    // Snow -->
    '13d': Icons.ac_unit,
    '13n': Icons.ac_unit,
    '50d': Icons.blur_on,
    '50n': Icons.blur_on,
  };

  return iconMap[iconCode];
}
