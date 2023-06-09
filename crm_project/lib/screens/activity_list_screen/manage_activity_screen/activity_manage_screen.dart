import 'dart:developer';

import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/common_modules/common_textfield_header_module.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:crm_project/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/activity_module_controllers/activity_manage_screen_controller.dart';
import 'activity_manage_screen_widgets.dart';

class ActivityManageScreen extends StatelessWidget {
  ActivityManageScreen({Key? key}) : super(key: key);
  final activityManageScreenController =
      Get.put(ActivityManageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: activityManageScreenController.activityOption ==
                  ActivityOption.create
              ? AppMessage.addActivity
              : AppMessage.editActivity,
          leadingShow: false,
          actionShow: false),
      body: SafeArea(
        child: Obx(
                () => activityManageScreenController.isLoading.value
                    ? CommonLoader().showLoader()
                    : SingleChildScrollView(
                  child: Form(
                    key: activityManageScreenController.activityManageKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activityManageScreenController.activityOption ==
                                  ActivityOption.create
                              ? AppMessage.activityDetails
                              : activityManageScreenController.activityName,
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Enter Your Activity Details.",
                          style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
//title
                        CommonTextFieldHeaderModule(
                            header: AppMessage.title, required: true),
                        const SizedBox(height: 2),
                        TextFieldModule(
                          fieldController: activityManageScreenController
                              .titleTextFieldController,
                          hintText: AppMessage.title,
                          keyboardType: TextInputType.multiline,
                          validate: (value) =>
                              FieldValidation().validateEmpty(value, 'Title'),
                        ),
                        const SizedBox(height: 10),
//Activity Type
                        CommonTextFieldHeaderModule(
                            header: AppMessage.activityType, required: true),
                        const SizedBox(height: 2),
                        ActivityTypeWidget(),
                        const SizedBox(height: 10),
//Priority
                        CommonTextFieldHeaderModule(
                            header: AppMessage.priority, required: false),
                        const SizedBox(height: 2),
                        PriorityTypeWidget(),
                        const SizedBox(height: 10),
//Activity Status
                        CommonTextFieldHeaderModule(
                            header: AppMessage.activityStatus, required: true),
                        const SizedBox(height: 2),
                        ActivityStatusTypeWidget(),
                        const SizedBox(height: 10),
//start Date
                        CommonTextFieldHeaderModule(
                            header: AppMessage.startDate, required: true),
                        const SizedBox(height: 2),
                        StartDateActivityManageScreenWidget(),
                        const SizedBox(height: 10),
//Due Date
                        CommonTextFieldHeaderModule(
                            header: AppMessage.dueDate, required: true),
                        const SizedBox(height: 2),
                         DueDateActivityManageScreenWidget(),
                        const SizedBox(height: 10),
//complete Date
                        CommonTextFieldHeaderModule(
                            header: AppMessage.completeDate, required: false),
                        const SizedBox(height: 2),
                         CompleteDateActivityManageScreenWidget(),
                        const SizedBox(height: 10),
//reminder
                        CommonTextFieldHeaderModule(
                            header: AppMessage.reminder, required: false),
                        const SizedBox(height: 2),

//status tongal button
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Transform.scale(
                                alignment: AlignmentDirectional.centerEnd,
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  activeColor: AppColors.appColors,
                                  trackColor: AppColors.appColorsSecondry,
                                  value: activityManageScreenController
                                      .reminderStatus.value,
                                  onChanged: (value) {
                                    activityManageScreenController
                                        .reminderStatus.value = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        activityManageScreenController.reminderStatus.value == false ? const SizedBox():Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
//reminder Date reminder Time
                            Row(
                              children: [
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
//reminder Date
                                    CommonTextFieldHeaderModule(
                                        header: AppMessage.reminderDate,
                                        required: false),
                                    const SizedBox(height: 2),
                                    ReminderDateActivityManageScreenWidget(),
                                  ],
                                )),
                                const SizedBox(width: 5,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
//reminder Time
                                    CommonTextFieldHeaderModule(
                                        header: AppMessage.reminderTime,
                                        required: false),
                                    const SizedBox(height: 2),
                                    ReminderTimeActivityManageScreenWidget(),
                                  ],
                                )),


                              ],
                            ),
                            const SizedBox(height: 10),
//reminderNote
                            CommonTextFieldHeaderModule(
                                header: AppMessage.reminderNote,
                                required: false),
                            const SizedBox(height: 2),
                            TextFieldModule(
                              fieldController: activityManageScreenController
                                  .reminderNoteTextFieldController,
                              hintText: AppMessage.reminderNote,
                              keyboardType: TextInputType.multiline,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
//notes
                        CommonTextFieldHeaderModule(
                            header: AppMessage.notes, required: false),
                        const SizedBox(height: 2),
                        TextFieldModule(
                          fieldController: activityManageScreenController
                              .notesTextFieldController,
                          hintText: AppMessage.notes,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: 10),
                        //Update Button
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: SizedBox(
                              height: 5.5.h,width: Get.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.appColors),
                                  onPressed: () async {
                                    if (activityManageScreenController
                                        .activityManageKey.currentState!
                                        .validate()) {
                                      if(activityManageScreenController.activityOption == ActivityOption.update){
                                        log("Update Activity Api");
                                        activityManageScreenController.updateActivityFunction();
                                      }
                                      else{
                                        log("Add Activity Api");
                                        activityManageScreenController.addActivityFunction();
                                      }
                                    }else{
                                    }
                                  },
                                  child: Text( activityManageScreenController.activityOption == ActivityOption.update ? AppMessage.update : AppMessage.addActivity))),
                        ),

                      ],
                    ).paddingAll(10),
                  ),
                ),
              ),
      ),
    );
  }
}
