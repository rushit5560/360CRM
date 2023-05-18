import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class TextRow extends StatelessWidget {
  String title;
  String subTitle;
  String? suffix;
  Color? subTitleColor;


  TextRow({required this.title, required this.subTitle, this.suffix='',this.subTitleColor = AppColors.greyColor});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text('$title',
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),)),
        Expanded(child: Text('$subTitle$suffix',
          textAlign: TextAlign.end,
          style: TextStyle(color:subTitleColor,fontSize: 12.sp,fontWeight: FontWeight.bold),)),
      ],);
  }
}


class SubTextRow extends StatelessWidget {
  String title;
  String subTitle;
  String? suffix;

  SubTextRow({required this.title,required this.subTitle, this.suffix});


  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('- $title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),
        Text('$subTitle$suffix',style: TextStyle(color:AppColors.greyColor,fontSize: 12.sp,fontWeight: FontWeight.bold),),
      ],).paddingOnly(left: 3.w);
  }
}

