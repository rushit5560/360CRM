import 'package:crm_project/common_modules/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';
import '../utils/messaging.dart';

Widget CommonLabelExportModule({
  Function? export,
  required String title,
  required bool exportStatus
}){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.appColors,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ),
          exportStatus ?  InkWell(
            onTap: () => export,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.w),
                border: Border.all(
                  color: AppColors.appColors,
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.file_download,
                    size: 4.w,
                    color: AppColors.appColors,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    AppMessage.export,
                    style: TextStyle(
                      color: AppColors.appColors,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ).paddingAll(4),
            ),
          ) : const SizedBox(),
        ],
      ).paddingOnly(top: 8),
      const CustomDivider(),
    ],
  );
}