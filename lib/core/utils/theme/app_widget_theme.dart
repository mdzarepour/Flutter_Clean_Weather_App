import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/constants/const_colors.dart';

class AppWidgetTheme {
  //outlined button theme -->
  static ButtonStyle outlinedButtonTheme = OutlinedButton.styleFrom(
    iconColor: ConstantColors.materialWhite,
    iconSize: 27,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    fixedSize: const Size(200, 50),
  );
  // bottom navigation theme -->
  static const BottomNavigationBarThemeData bottomNavigatorThemeData =
      BottomNavigationBarThemeData(
        selectedItemColor: ConstantColors.materialWhite,
        unselectedItemColor: ConstantColors.materialSecondGrey,
        backgroundColor: ConstantColors.scaffoldDarkBackGround,
      );
  // icon theme -->
  static const IconThemeData iconTheme = IconThemeData(
    color: ConstantColors.materialWhite,
    size: 100,
  );
  //text fiels theme -->
  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    border: InputBorder.none,
    prefixIconColor: ConstantColors.materialSecondGrey,
    hintStyle: TextStyle(
      color: ConstantColors.materialSecondGrey,
      fontSize: 16,
      fontFamily: 'Poppins_Medium',
      fontWeight: FontWeight.w400,
    ),
  );
  // appbar theme  -->
  static AppBarTheme appBarTheme = AppBarTheme(
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: ConstantColors.scaffoldDarkBackGround,
    titleTextStyle: TextStyle(
      color: ConstantColors.materialWhite,
      fontSize: 30,
      fontFamily: 'Poppins_SemiBold',
      fontWeight: FontWeight.w700,
      letterSpacing: 2.5,
    ),
  );
  static ProgressIndicatorThemeData indicatorTheme = ProgressIndicatorThemeData(
    color: ConstantColors.materialSecondGrey,
  );
}
