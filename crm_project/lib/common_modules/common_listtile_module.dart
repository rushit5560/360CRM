// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

// ignore: must_be_immutable
class CommonListTitleModule extends StatelessWidget {
final String titleText;
final Icon icon;
Function()? ontap;

  CommonListTitleModule({
    Key? key,
    required this.titleText,
    required this.icon,
    this.ontap,
  }) : super(key: key);

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
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        onTap: ontap,
      ),
    ).paddingOnly(bottom: 10);
  }
}
