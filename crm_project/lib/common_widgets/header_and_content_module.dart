import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class HeaderAndContentModule extends StatelessWidget {
  final String headerText;
  final String contentText;
  const HeaderAndContentModule({Key? key, required this.headerText, required this.contentText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
              headerText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color:
                  AppColors.blackColor.withOpacity(0.6))
          ),
        ), 
        Expanded(
          child: Text(
              contentText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color:
                  AppColors.blackColor.withOpacity(0.6))
          ),
        ),
      ],
    );
  }
}
