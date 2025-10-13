import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/const_colors.dart';
import 'package:weather_app/core/theme/app_widget_theme.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppWidgetTheme.appBarTheme,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    iconTheme: AppWidgetTheme.iconTheme,
    inputDecorationTheme: AppWidgetTheme.inputDecorationTheme,
    bottomNavigationBarTheme: AppWidgetTheme.bottomNavigatorThemeData,
    colorScheme: const ColorScheme.dark(
      surface: ConstantColors.scaffoldDarkBackGround,
      brightness: Brightness.dark,
    ),
  );
}
