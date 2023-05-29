import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../controller/bill_manage_screen_controller.dart';
import '../../../models/ledger_screen_model/active_company_list_model.dart';
import '../../../models/ledger_screen_model/active_property_model.dart';
import '../../../utils/messaging.dart';

class BillCompanyDropDownModule extends StatelessWidget {
  BillCompanyDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BillManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: AppMessage.companyLabel,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                    color: AppColors.redColor),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<CompanyData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: Text(
              AppMessage.selectCompanyLabel,
              style: const TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              screenController.companyDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.companyDataValue,
            items: screenController.companyList.map((value) {
              return DropdownMenuItem<CompanyData>(
                value: value,
                child: Text(value.companyName!),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}


class BillPropertyDropDownModule extends StatelessWidget {
  BillPropertyDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BillManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: AppMessage.propertyLabel,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<PropertyData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: Text(
              AppMessage.selectPropertyLabel,
              style: const TextStyle(color: AppColors.appColors),
            ),
            value: screenController.propertyDataValue,
            onChanged: (newValue) async {
              screenController.propertyDataValue = newValue!;
              screenController.loadUI();
            },
            items: screenController.propertyList.map((value) {
              return DropdownMenuItem<PropertyData>(
                value: value,
                child: Text(value.propertyName!),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}