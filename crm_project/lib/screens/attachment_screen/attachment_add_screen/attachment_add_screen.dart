import 'dart:developer';
import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/attachment_add_screen_controller.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:crm_project/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';
import '../../../common_modules/common_textfield_header_module.dart';

class AttachmentAddScreen extends StatelessWidget {
  AttachmentAddScreen({Key? key}) : super(key: key);
  final attachmentAddScreenController =
      Get.put(AttachmentAddScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: 'Add Attachments', leadingShow: false, actionShow: false),
      body: SafeArea(
        child: Obx(
          () => attachmentAddScreenController.isLoading.value
              ? CommonLoader().showLoader()
              : SingleChildScrollView(
                  child: Form(
                    key: attachmentAddScreenController.attachmentKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      CommonTextFieldHeaderModule(header: AppMessage.description,required: true),
                      const SizedBox(height: 5,),
                      TextFieldModule(
                          fieldController: attachmentAddScreenController
                              .descriptionTextFieldController,
                          hintText: AppMessage.description,
                          validate: (value) => FieldValidation()
                              .validateEmpty(value, 'Description'),
                          keyboardType: TextInputType.text),
                      const SizedBox(height: 10),

                          CommonTextFieldHeaderModule(header: AppMessage.selectAttachmentType,required: true),
                          const SizedBox(height: 5,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: AppColors.appColors, width: 1),
                        ),
                        child: attachmentAddScreenController.isLoading.value
                            ? Container()
                            : DropdownButtonFormField(
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                hint: Text(
                                  attachmentAddScreenController
                                      .attachmentTypeSelected.value,
                                  style: const TextStyle(
                                      color: AppColors.appColors),
                                ),
                                // Not necessary for Option 1
                                onChanged: (newValue) async {
                                  attachmentAddScreenController
                                          .attachmentTypeSelected.value =
                                      newValue!.attachmentTypes.toString();
                                  attachmentAddScreenController
                                          .attachmentTypeId.value =
                                      newValue.attachmentTypeId.toString();
                                  log('new Attachment Type :  ${attachmentAddScreenController.attachmentTypeSelected.value}');
                                  log('new Attachment Type id :  ${attachmentAddScreenController.attachmentTypeId.value}');
                                },
                                items: attachmentAddScreenController
                                    .attachmentTypeListDropDown
                                    .map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e.attachmentTypes),
                                  );
                                }).toList(),
                              ).paddingOnly(left: 8, right: 8),
                      ),
                      const SizedBox(height: 10),
                          CommonTextFieldHeaderModule(header: AppMessage.chooseFile,required: true),
                          const SizedBox(height: 5,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: AppColors.appColors, width: 1.5),
                        ),
                        child: InkWell(
                          onTap: () {
                            attachmentAddScreenController.filePickFunction();
                          },
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    attachmentAddScreenController
                                            .filePath.isNotEmpty
                                        ? attachmentAddScreenController
                                            .fileName.value
                                        : AppMessage.noFileChoose,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.greyColor),
                                  ).paddingOnly(left: 10)),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: AppColors.appColors,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                      child: const Icon(
                                    Icons.file_copy_outlined,
                                  ).paddingAll(
                                          10)) //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
                                  ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Active',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  color:
                                      AppColors.blackColor.withOpacity(0.6))),
                          const SizedBox(
                            width: 10,
                          ),
                          Obx(
                            () => attachmentAddScreenController.isLoading.value
                                ? Container()
                                : Transform.scale(
                                    alignment: AlignmentDirectional.centerStart,
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                      activeColor: AppColors.appColors,
                                      trackColor: AppColors.appColorsSecondry,
                                      value: attachmentAddScreenController
                                          .attachmentIsActive.value,
                                      onChanged: (value) async {
                                        attachmentAddScreenController
                                            .attachmentIsActive.value = value;
                                      },
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: FractionalOffset.centerRight,
                        child: ElevatedButton(
                            onPressed: () {
                              if (attachmentAddScreenController
                                  .attachmentKey.currentState!
                                  .validate()) {
                                log("Attachment validate ");
                                if (attachmentAddScreenController
                                    .attachmentTypeId.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Please select Attachment File type.',
                                      backgroundColor: AppColors.redColor);
                                } else {
                                  if (attachmentAddScreenController
                                          .filePath.isEmpty ||
                                      attachmentAddScreenController
                                          .fileName.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: 'Please Pick File.',
                                        backgroundColor: AppColors.redColor);
                                  } else {
                                    attachmentAddScreenController
                                        .addAttachmentFunction();
                                  }
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.appColors),
                            child: Text(
                              AppMessage.add,
                              style: TextStyle(
                                  fontSize: 12.sp, color: AppColors.whiteColor),
                            ).paddingOnly(left: 5, right: 5)),
                      ),
                    ]).paddingOnly(left: 15, right: 15, top: 20),
                  ),
                ),
        ),
      ),
    );
  }
}
