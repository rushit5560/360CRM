import 'dart:developer';

import 'package:crm_project/controller/company_module_controllers/address_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_textfield.dart';
import '../../../common_modules/divider.dart';
import '../../../constants/colors.dart';
import '../../../utils/messaging.dart';

class AddressSearchWidget extends StatelessWidget {
  AddressSearchWidget({Key? key}) : super(key: key);
  final addressListScreenController =
      Get.find<AddressListScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
            fieldController:
            addressListScreenController.searchTextFieldController,
            hintText: 'Search...',
            onChange: (text) {
              log(text.toString());
            },
            backgroundColor: AppColors.whiteColor,
            icon: const Icon(Icons.search).paddingOnly(left: 5, right: 5),
            keyboardType: TextInputType.text)
        .paddingOnly(top: 20, bottom: 5);
  }
}

class AddressListWidget extends StatelessWidget {
  AddressListWidget({Key? key}) : super(key: key);
  final addressListScreenController =
      Get.find<AddressListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                AppMessage.addressList,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.appColors,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.w),
                  border: Border.all(color: AppColors.appColors, width: 1)),
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
            )
          ],
        ).paddingOnly(top: 8),
        const CustomDivider(),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColors.appColors.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [],
          ).paddingAll(10),
        )
      ],
    );
  }
}
