import 'package:crm_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSubmitButton extends StatelessWidget {
 final Function() onPress;
  final String labelText;
  final Color buttonColor;
  final Color textColor;
  final double? labelSize;

  const CustomSubmitButton(
      {super.key,
      required this.onPress,
      required this.labelText,
      this.buttonColor = AppColors.appColors,
      this.textColor = AppColors.whiteColor1,
      this.labelSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () {
          onPress();
        },
        child: Text(
          labelText,
          style: TextStyle(color: textColor, fontSize: labelSize ?? 14.sp),
        ));
  }
}
