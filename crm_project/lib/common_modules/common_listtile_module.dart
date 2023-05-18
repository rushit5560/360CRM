import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';
import '../utils/messaging.dart';

class CommonListTitleModule extends StatelessWidget {
String titleText;
Icon icon;
Function()? ontap;

CommonListTitleModule({required this.titleText,required this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.appColors.withOpacity(0.1)),
      child: ListTile(
        leading: icon,
        title: Text(titleText,style: TextStyle(fontSize: 15.sp,),),
        trailing: Icon(Icons.arrow_forward_ios_outlined),

      ),
    ).paddingOnly(bottom: 10);
  }
}
