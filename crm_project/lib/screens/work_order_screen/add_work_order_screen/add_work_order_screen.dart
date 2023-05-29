import 'dart:developer';

import 'package:crm_project/common_modules/common_toast_module.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/work_order_module_controllers/add_work_order_screen_controller.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_loader.dart';
import '../../../../constants/colors.dart';
import '../../../../models/work_order_screen_models/active_work_order_list_model.dart';
import '../../../common_modules/common_textfield_header_module.dart';

class AddWorkOrderScreen extends StatelessWidget {
   AddWorkOrderScreen({Key? key}) : super(key: key);
   final addWorkOrderScreenController = Get.put(AddWorkOrderScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: CustomAppBar(titleText: AppMessage.addWorkOrder, leadingShow: false, actionShow: false),
      body: Obx(
        () => addWorkOrderScreenController.isLoading.value
        ? CommonLoader().showLoader()
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        CommonTextFieldHeaderModule(header: AppMessage.selectWorkOrder,required: true),
        const SizedBox(height: 5,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border:
            Border.all(color: AppColors.appColors, width: 1),
          ),
          child: addWorkOrderScreenController.isLoading.value
              ? Container()
              : DropdownButtonFormField<WorkOrderListData>(
            decoration: const InputDecoration(
                border: InputBorder.none),
            hint: Text(addWorkOrderScreenController.workOrderTypeValue.workOrderDetails.toString(),
              style: const TextStyle(
                  color: AppColors.appColors),
            ),
            value: addWorkOrderScreenController.workOrderTypeValue,
            // Not necessary for Option 1
            onChanged: (newValue) async {
              addWorkOrderScreenController.workOrderTypeValue = newValue!;
              log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.toJson()}');
              log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderDetails}');
              log('new Attachment Type id :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderTypeId}');
            },
            items: addWorkOrderScreenController
                .workOrderListDropDown
                .map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e.workOrderDetails.toString()),
              );
            }).toList(),
          ).paddingOnly(left: 8, right: 8),
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            Text('Active',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                    color: AppColors.blackColor
                        .withOpacity(0.6))),

            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Transform.scale(
                  alignment: AlignmentDirectional.centerEnd,
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: AppColors.appColors,
                    trackColor: AppColors.appColorsSecondry,
                    value: addWorkOrderScreenController.workOrderIsActive.value,
                    onChanged: (value) {
                      addWorkOrderScreenController.workOrderIsActive.value = value;
                    },
                  ),
                ),
              ),
            ),


          ],
        ),

        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: SizedBox(
              height: 5.5.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appColors),
                  onPressed: () async {
                    if(addWorkOrderScreenController.workOrderTypeValue.workOrderDetails == AppMessage.selectWorkOrder) {
                      CommonToastModule(msg: 'Select work order!',backgroundColor: AppColors.redColor);
                    } else {
                      await addWorkOrderScreenController.addWorkOrderFunction();
                      log('Add');
                    }
                  },
                  child: const Text('Add'))),
        ),
      ],
    ).paddingAll(10),
    ),
    );
  }
}
