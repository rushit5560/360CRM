import 'dart:developer';

import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/models/activity_manage_screen_models/priority_list_model.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:crm_project/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../controller/activity_module_controllers/activity_manage_screen_controller.dart';
import '../../../models/activity_manage_screen_models/activity_status_list_model.dart';
import '../../../models/activity_manage_screen_models/activity_type_list_model.dart';
import '../../../utils/decorations.dart';
import '../../../utils/messaging.dart';

//activity Type Drop Down
class ActivityTypeWidget extends StatelessWidget {
  ActivityTypeWidget({Key? key}) : super(key: key);
  final activityManageScreenController =
      Get.find<ActivityManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return activityManageScreenController.isLoading.value
        ? Container()
        : DropdownButtonHideUnderline(
            child: DropdownButtonFormField<ActivityTypeListData>(
              isExpanded: true,
              decoration: dropdownInputDecoration,
              hint: const Text(
                AppMessage.selectActivityType,
                style: TextStyle(color: AppColors.appColors),
              ),
              value: activityManageScreenController.activityTypeListValue,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.type == AppMessage.selectActivityType) {
                  return "Please ${AppMessage.selectActivityType}";
                }
                return null;
              },
              onChanged: (newValue) async {
                activityManageScreenController.activityTypeListValue =
                    newValue!;
                log('new Type :  ${activityManageScreenController.activityTypeListValue.toJson()}');
                // log('new typeType :  ${detailWorkOrderScreenController.workOrderTypeListValue.type}');
                // log('new Type id :  ${detailWorkOrderScreenController.workOrderTypeListValue.workOrderTypeId}');
              },
              // Getting From Controller
              items: activityManageScreenController.activityTypeListDropDown
                  .map((value) {
                return DropdownMenuItem<ActivityTypeListData>(
                  value: value,
                  child: Text(value.type!),
                );
              }).toList(),
            ),
          );
  }
}

//priority Type Drop Down
class PriorityTypeWidget extends StatelessWidget {
  PriorityTypeWidget({Key? key}) : super(key: key);
  final activityManageScreenController =
      Get.find<ActivityManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return activityManageScreenController.isLoading.value
        ? Container()
        : DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              //<WorkOrderTypeData>(
              isExpanded: true,
              decoration: dropdownInputDecoration,
              hint: const Text(
                AppMessage.selectPriority,
                style: TextStyle(color: AppColors.appColors),
              ),
              value: activityManageScreenController.priorityListValue,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              // if (value!.prioritys == AppMessage.selectPriority) {
              //   return "Please ${AppMessage.selectPriority}";
              // }
              // return null;
              // },
              onChanged: (newValue) async {
                activityManageScreenController.priorityListValue = newValue!;
                log('new Type :  ${activityManageScreenController.priorityListValue.toJson()}');
                // log('new typeType :  ${detailWorkOrderScreenController.workOrderTypeListValue.type}');
                // log('new Type id :  ${detailWorkOrderScreenController.workOrderTypeListValue.workOrderTypeId}');
              },
              // Getting From Controller
              items: activityManageScreenController.priorityListDropDown
                  .map((value) {
                return DropdownMenuItem<PriorityListData>(
                  value: value,
                  child: Text(value.prioritys!),
                );
              }).toList(),
            ),
          );
  }
}

//activity Status
class ActivityStatusTypeWidget extends StatelessWidget {
  ActivityStatusTypeWidget({Key? key}) : super(key: key);
  final activityManageScreenController =
      Get.find<ActivityManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return activityManageScreenController.isLoading.value
        ? Container()
        : DropdownButtonHideUnderline(
            child: DropdownButtonFormField<ActivityStatusListData>(
              isExpanded: true,
              decoration: dropdownInputDecoration,
              hint: const Text(
                AppMessage.selectActivityStatus,
                style: TextStyle(color: AppColors.appColors),
              ),
              value: activityManageScreenController.activityStatusListValue,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.status == AppMessage.selectActivityStatus) {
                  return "Please ${AppMessage.selectActivityStatus}";
                }
                return null;
              },
              onChanged: (newValue) async {
                activityManageScreenController.activityStatusListValue =
                    newValue!;
                log('new Type :  ${activityManageScreenController.activityStatusListValue.toJson()}');
                // log('new typeType :  ${detailWorkOrderScreenController.workOrderTypeListValue.type}');
                // log('new Type id :  ${detailWorkOrderScreenController.workOrderTypeListValue.workOrderTypeId}');
              },
              // Getting From Controller
              items: activityManageScreenController.activityStatusListDropDown
                  .map((value) {
                return DropdownMenuItem<ActivityStatusListData>(
                  value: value,
                  child: Text(value.status!),
                );
              }).toList(),
            ),
          );
  }
}

//Start Date
class StartDateActivityManageScreenWidget extends StatelessWidget {
  StartDateActivityManageScreenWidget({Key? key}) : super(key: key);

  final activityManageScreenController =
      Get.find<ActivityManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
      fieldController: activityManageScreenController.showSelectedStartDate,
      hintText: activityManageScreenController.showSelectedStartDate.text,
      keyboardType: TextInputType.text,
      readOnly: true,
      validate: (value) =>
          FieldValidation().startDateValidator(activityManageScreenController.selectedStartDate,activityManageScreenController.selectedDueDate),
      icon: GestureDetector(
          onTap: () async{
            activityManageScreenController.selectedDateType =
                              ActivityManageDate.startDate;
            await activityManageScreenController.selectDate(context);
          },
          child: const Icon(
            Icons.calendar_today_outlined,
            color: AppColors.appColors,
          )),
    );

    //   Obx(
    //       () => Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(5),
    //           border: Border.all(color: AppColors.appColors, width: 1),
    //         ),
    //         child: Row(
    //           children: [
    //             Expanded(
    //                 child:TextFieldModule(fieldController: activityManageScreenController.showSelectedStartDate, hintText: "Select Date", keyboardType: TextInputType.none,readOnly: true,)
    //                 // Text(
    //                 //   activityManageScreenController.showSelectedStartDate.value,
    //                 //   overflow: TextOverflow.ellipsis,
    //                 //   maxLines: 1,
    //                 //   style: TextStyle(
    //                 //     fontSize: 12.sp,
    //                 //     fontWeight: FontWeight.bold,
    //                 //     // color: AppColors.greyColor,
    //                 //   ),
    //                 ).paddingOnly(left: 10),
    //             GestureDetector(
    //               onTap: () async {
    //                 activityManageScreenController.selectedDateType =
    //                     ActivityManageDate.startDate;
    //                 await activityManageScreenController.selectDate(context);
    //               },
    //               child: Expanded(
    //                 child: SizedBox(
    //                   child: Center(
    //                     child: const Icon(Icons.calendar_today_outlined)
    //                         .paddingAll(12),
    //                   ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ).paddingOnly(bottom: 5),
    // );
  }
}

//Due Date
class DueDateActivityManageScreenWidget extends StatelessWidget {
  DueDateActivityManageScreenWidget({Key? key}) : super(key: key);

  final activityManageScreenController =
      Get.find<ActivityManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
      fieldController: activityManageScreenController.showSelectedDueDate,
      hintText: activityManageScreenController.showSelectedDueDate.text,
      keyboardType: TextInputType.text,
      readOnly: true,
      validate: (value) =>
          FieldValidation().endDateValidator(activityManageScreenController.selectedStartDate,activityManageScreenController.selectedDueDate),
      icon: GestureDetector(
          onTap: () async{
            activityManageScreenController.selectedDateType =
                ActivityManageDate.dueDate;
            await activityManageScreenController.selectDate(context);
          },
          child: const Icon(
            Icons.calendar_today_outlined,
            color: AppColors.appColors,
          )),
    );

    //   Obx(
    //   () => Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(5),
    //       border: Border.all(color: AppColors.appColors, width: 1),
    //     ),
    //     child: Row(
    //       children: [
    //         Expanded(
    //             child: Text(
    //           activityManageScreenController.showSelectedDueDate.text,
    //           overflow: TextOverflow.ellipsis,
    //           maxLines: 1,
    //           style: TextStyle(
    //             fontSize: 12.sp,
    //             fontWeight: FontWeight.bold,
    //             // color: AppColors.greyColor,
    //           ),
    //         ).paddingOnly(left: 10)),
    //         GestureDetector(
    //           onTap: () async {
    //             activityManageScreenController.selectedDateType =
    //                 ActivityManageDate.dueDate;
    //             await activityManageScreenController.selectDate(context);
    //           },
    //           child: SizedBox(
    //             child: Center(
    //               child:
    //                   const Icon(Icons.calendar_today_outlined).paddingAll(12),
    //             ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
    //           ),
    //         ),
    //       ],
    //     ),
    //   ).paddingOnly(bottom: 5),
    // );
  }
}

//Complete Date
class CompleteDateActivityManageScreenWidget extends StatelessWidget {
  CompleteDateActivityManageScreenWidget({Key? key}) : super(key: key);

  final activityManageScreenController =
      Get.find<ActivityManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.appColors, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(
              activityManageScreenController.showSelectedCompletedDate.value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                // color: AppColors.greyColor,
              ),
            ).paddingOnly(left: 10)),
            GestureDetector(
              onTap: () async {
                activityManageScreenController.selectedDateType =
                    ActivityManageDate.completeDate;
                await activityManageScreenController.selectDate(context);
              },
              child: SizedBox(
                child: Center(
                  child:
                      const Icon(Icons.calendar_today_outlined).paddingAll(12),
                ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
              ),
            ),
          ],
        ),
      ).paddingOnly(bottom: 5),
    );
  }
}

//Reminder Date
class ReminderDateActivityManageScreenWidget extends StatelessWidget {
  ReminderDateActivityManageScreenWidget({Key? key}) : super(key: key);

  final activityManageScreenController =
      Get.find<ActivityManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.appColors, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(
              activityManageScreenController.showSelectedReminderDate.value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                // color: AppColors.greyColor,
              ),
            ).paddingOnly(left: 10)),
            GestureDetector(
              onTap: () async {
                activityManageScreenController.selectedDateType =
                    ActivityManageDate.reminderDate;
                await activityManageScreenController.selectDate(context);
              },
              child: SizedBox(
                child: Center(
                  child:
                      const Icon(Icons.calendar_today_outlined).paddingAll(12),
                ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
              ),
            ),
          ],
        ),
      ).paddingOnly(bottom: 5),
    );
  }
}

//Reminder Time 24hrs
class ReminderTimeActivityManageScreenWidget extends StatelessWidget {
  ReminderTimeActivityManageScreenWidget({Key? key}) : super(key: key);
  final activityManageScreenController =
      Get.find<ActivityManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.appColors, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(
              activityManageScreenController.showSelectedReminderTime.value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                // color: AppColors.greyColor,
              ),
            ).paddingOnly(left: 10)),
            GestureDetector(
              onTap: () async {
                await activityManageScreenController.selectTime(context);
              },
              child: SizedBox(
                child: Center(
                  child: const Icon(Icons.access_time_rounded).paddingAll(12),
                ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
              ),
            ),
          ],
        ),
      ).paddingOnly(bottom: 5),
    );
  }
}
