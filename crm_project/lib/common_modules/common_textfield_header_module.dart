import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class CommonTextFieldHeaderModule extends StatelessWidget {
  String header;
  bool required;

  CommonTextFieldHeaderModule({required this.header, required this.required});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: header,
         style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
            color: AppColors.blackColor.withOpacity(0.6)),
        children: [
          TextSpan(
            text:required ? " *" : '',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.redColor),
          ),
        ],
      ),
    );
  }
}
