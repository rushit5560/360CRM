import 'dart:developer';

import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/controller/company_module_controllers/attachment_list_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_bottomsheet_module.dart';
import '../../../common_modules/common_textfield.dart';
import '../../../common_modules/divider.dart';
import '../../../constants/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/messaging.dart';

class AttachmentSearchWidget extends StatelessWidget {
  AttachmentSearchWidget({Key? key}) : super(key: key);
  final attachmentListScreenControllerListScreenController =
      Get.find<AttachmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
            fieldController: attachmentListScreenControllerListScreenController
                .searchTextFieldController,
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

class AttachmentListWidget extends StatelessWidget {
  AttachmentListWidget({Key? key}) : super(key: key);
  final attachmentListScreenControllerListScreenController =
      Get.find<AttachmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                AppMessage.attachmentList,
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
        Expanded(
            child: attachmentListScreenControllerListScreenController
                    .attachmentList.isEmpty
                ? const Center(
                    child: Text("No Data"),
                  )
                : ListView.builder(
                    itemCount:
                        attachmentListScreenControllerListScreenController
                                .attachmentList.length +
                            1,
                    controller:
                        attachmentListScreenControllerListScreenController
                            .scrollController,
                    itemBuilder: (context, index) {
                      if (index <
                          attachmentListScreenControllerListScreenController
                              .attachmentList.length) {
                        return Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: AppColors.appColors.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          attachmentListScreenControllerListScreenController
                                              .attachmentList[index]
                                              .description,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.blackColor)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          '${AppMessage.type}: ${attachmentListScreenControllerListScreenController.attachmentList[index].attachmentType.attachmentTypes}',
                                          //'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.sp,
                                              color: AppColors.blackColor
                                                  .withOpacity(0.6))),
                                      Text(
                                          '${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(attachmentListScreenControllerListScreenController.attachmentList[index].attachmentType.createdOn)}',
                                          //'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.sp,
                                              color: AppColors.blackColor
                                                  .withOpacity(0.6))),
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          log('attachmentId: ${attachmentListScreenControllerListScreenController.attachmentList[index].attachmentId}');
                                          CommonbottomSheetModule(
                                            context: context,
                                            icon: Icon(Icons.info_outline,
                                                color: AppColors.greyColor,
                                                size: Get.width * .4),
                                            titleText: AppMessage.areYouSure,
                                            subTitleText: AppMessage
                                                .doYouWantToDeleteThisRecord,
                                            onYesText: AppMessage.yesDeleteIt,
                                            onCancelText: AppMessage.cancel,
                                            onYesTap: () async {
                                              Get.back();
                                              await attachmentListScreenControllerListScreenController
                                                  .deleteAttachmentFunction(
                                                      index: index,
                                                      attachmentId:
                                                          attachmentListScreenControllerListScreenController
                                                              .attachmentList[
                                                                  index]
                                                              .attachmentId
                                                              .toString());
                                            },
                                            onCancelTap: () =>
                                                Navigator.of(context)
                                                    .pop(false),
                                          );
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          size: 7.w,
                                          color: AppColors.redColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Obx(
                                        () =>
                                            attachmentListScreenControllerListScreenController
                                                    .isLoading.value
                                                ? Container()
                                                : Transform.scale(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .centerEnd,
                                                    scale: 0.8,
                                                    child: CupertinoSwitch(
                                                      activeColor:
                                                          AppColors.appColors,
                                                      trackColor: AppColors
                                                          .appColorsSecondry,
                                                      value:
                                                          attachmentListScreenControllerListScreenController
                                                              .attachmentList[
                                                                  index]
                                                              .isActive,
                                                      onChanged: (value) async {
                                                        await attachmentListScreenControllerListScreenController
                                                            .statusChangeAttachmentFunction(
                                                                attachmentId: attachmentListScreenControllerListScreenController
                                                                    .attachmentList[
                                                                        index]
                                                                    .attachmentId.toString(),
                                                                status: value,
                                                                index: index);
                                                      },
                                                    ),
                                                  ),
                                      ),
                                    ],
                                  ))
                            ],
                          ).paddingAll(10),
                        ).paddingOnly(bottom: 8);
                      } else {
                        return attachmentListScreenControllerListScreenController
                                .hasMore
                            ? CommonLoader().showLoader()
                            : const Center(child: Text('No more work orders!'));
                      }
                    },
                  ))
      ],
    );
  }
}
