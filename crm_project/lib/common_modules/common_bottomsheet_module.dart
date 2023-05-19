
import 'package:crm_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: non_constant_identifier_names
Future CommonbottomSheetModule ({
  required BuildContext context,
required  Icon icon,
  required String titleText,
  required String subTitleText,
  required String onYesText,
  required String onCancelText,

  required Function() onYesTap,
  required Function() onCancelTap,
}) async {
    showModalBottomSheet(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.w), topRight: Radius.circular(10.w))),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: Get.width * .8,
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: icon),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      titleText,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      subTitleText,
                      style: TextStyle(
                          color: AppColors.greyColor, fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appColors),
                    onPressed: onYesTap,
                    child: Text(onYesText),
                  ),
                  const SizedBox(width: 14),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.appColors, width: 1.5),
                    ),
                    onPressed: onCancelTap,
                    child: Text(
                      onCancelText,
                      style: const TextStyle(color: AppColors.appColors),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingAll(15),
        );
      },
    );
  }
