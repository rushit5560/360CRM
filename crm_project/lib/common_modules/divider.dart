import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  const CustomDivider({super.key, this.color = AppColors.greyColor, this.thickness = 1.0});

  @override
  Widget build(BuildContext context) {
    return Divider(color: color, thickness: thickness);
  }
}
