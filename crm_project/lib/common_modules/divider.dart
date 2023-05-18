import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDivider extends StatelessWidget {
  Color color;
  double thickness;
  CustomDivider({this.color = AppColors.greyColor, this.thickness = 1.0});

  @override
  Widget build(BuildContext context) {
    return Divider(color: color,thickness: thickness);
  }
}
