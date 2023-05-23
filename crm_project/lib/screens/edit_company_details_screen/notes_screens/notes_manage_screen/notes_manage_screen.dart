import 'dart:developer';

import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_modules/common_textfield.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/notes_manage_screen_controller.dart';
import '../../../../utils/validator.dart';


class NotesManageScreen extends StatelessWidget {
  NotesManageScreen({Key? key}) : super(key: key);
  final notesManageScreenController = Get.put(NotesManageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
          actionShow: false, leadingShow: false,
          titleText: notesManageScreenController.appBarHeader.value,
      ),


      body: Obx(
        () => notesManageScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldModule(
                      fieldController: notesManageScreenController
                          .notesFieldController,
                      hintText: 'Notes',
                      keyboardType: TextInputType.text,
                      validate: (value) => FieldValidation()
                          .validateEmpty(value, 'notes')),

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
                              value: notesManageScreenController
                                  .isStatusSelected.value,
                              onChanged: (value) {
                                notesManageScreenController
                                    .changeStatusFunction();
                              },
                            ),
                          ),
                          /*child: Obx(
                            () => *//*notesManageScreenController.isLoading.value
                                ? Container()
                                : *//*Transform.scale(
                                    alignment: AlignmentDirectional.centerEnd,
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                      activeColor: AppColors.appColors,
                                      trackColor: AppColors.appColorsSecondry,
                                      value: notesManageScreenController
                                          .isStatusSelected.value,
                                      onChanged: (value) {
                                        notesManageScreenController
                                            .changeStatusFunction();
                                      },
                                    ),
                                  ),
                          ),*/
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
                              if(notesManageScreenController.notesOption == NotesOption.create) {
                                await notesManageScreenController.createNotesFunction();
                              } else {
                                await notesManageScreenController.updateNotesFunction();
                              }
                              // log("${notesManageScreenController.companyTypeTextField.text}");
                            },
                            child: Text(notesManageScreenController.notesOption == NotesOption.create ?'Add' : 'Submit'))),
                  ),
                ],
              ).paddingAll(10),
      ),
    );
  }
}
