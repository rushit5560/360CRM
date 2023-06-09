import 'dart:developer';

import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/activity_module_controllers/activity_user_manage_Screen_controller.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../common_modules/common_loader.dart';
import '../../../../../common_modules/common_textfield_header_module.dart';
import '../../../../../constants/colors.dart';
import '../../../../../models/activity_list_screen_models/activity_details_screen_models/activity_user_list_screen_models/activity_manage_user_screen_models/get_all_active_role_model.dart';
import '../../../../../utils/messaging.dart';

class ActivityUserManageScreen extends StatelessWidget {
  ActivityUserManageScreen({Key? key}) : super(key: key);
final activityUserManageScreenController = Get.put(ActivityUserManageScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: activityUserManageScreenController.activityUserManageOption == ActivityUserManageOption.update ?"Edit User": "Add User", leadingShow: false, actionShow: false),
      body: Scaffold(
          body: Obx(
                () => activityUserManageScreenController.isLoading.value
                ? CommonLoader().showLoader()
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                CommonTextFieldHeaderModule(header: AppMessage.selectRole,required: true),
                const SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                    Border.all(color: AppColors.appColors, width: 1),
                  ),
                  child: activityUserManageScreenController.isLoading.value
                      ? Container()
                      : DropdownButtonFormField<ActiveRoleData>(
                    decoration: const InputDecoration(
                        border: InputBorder.none),
                    hint: Text(activityUserManageScreenController.activeRoleSelectValue.toString(),
                      style: const TextStyle(
                          color: AppColors.appColors),
                    ),
                    value: activityUserManageScreenController.activeRoleSelectValue,
                    // Not necessary for Option 1
                    onChanged: (newValue) async {
                      activityUserManageScreenController.activeRoleSelectValue = newValue!;
                      log('new role Type :  ${activityUserManageScreenController.activeRoleSelectValue.toJson()}');
                      // log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderDetails}');
                      // log('new Attachment Type id :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderTypeId}');
                    },
                    items: activityUserManageScreenController.activeRoleListDropDown.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.fullName.toString() + " (${e.emailAddress.toString()})"),
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
                            value: activityUserManageScreenController.isActive.value,
                            onChanged: (value) {
                              activityUserManageScreenController.isActive.value = value;
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
                            // if(addWorkOrderScreenController.workOrderTypeValue.workOrderDetails == AppMessage.selectWorkOrder) {
                            //   CommonToastModule(msg: 'Select work order!',backgroundColor: AppColors.redColor);
                            // } else {
                            //   await addWorkOrderScreenController.addWorkOrderFunction();
                            //   log('Add');
                            // }
                          },
                          child: const Text('Add'))),
                ),
              ],
            ).paddingAll(10),
          ),
      ),
    );
  }
}
