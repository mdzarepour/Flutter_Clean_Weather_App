import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/const_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 5),
      child: Divider(color: ConstantColors.materialSecondGrey, thickness: 1.3),
    );
  }
}
