import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_modules/common_bottomsheet_module.dart';
import '../../../../common_modules/common_loader.dart';
import '../../../../common_widgets/header_and_content_module.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/contact_module_controller/pre_qualification_checklist_list_screen_controller.dart';
import '../../../../models/pre_qulification_checklist_screen_model/get_pre_qualification_list.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/messaging.dart';

class PreQualificationListWidgets extends StatelessWidget {
  PreQualificationListWidgets({Key? key}) : super(key: key);
  final preQualificationCheckListScreenController =
      Get.find<PreQualificationCheckListScreenController>();

  @override
  Widget build(BuildContext context) {
    return preQualificationCheckListScreenController
            .preQualificationList.isEmpty
        ? const Center(
            child: Text("No data"),
          )
        : ListView.builder(
      controller: preQualificationCheckListScreenController.scrollController,

      itemCount: preQualificationCheckListScreenController
                .preQualificationList.length,
            itemBuilder: (context, i) {
              PreQualificationList preQualificationList =
                  preQualificationCheckListScreenController
                      .preQualificationList[i];
              if (i <
                  preQualificationCheckListScreenController
                      .preQualificationList.length) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.appColors.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          // Date Module
                          HeaderAndContentModule(
                            headerText: AppMessage.dateLabel,

                            contentText: DateFormatChanger()
                                .dateFormat(preQualificationList.dateSubmitted),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 8, vertical: 8),

                      const SizedBox(height: 10),

                      // Status, Edit & Delete Button Module
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.appColors.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                // Get.to(() => BillManageScreen(),
                                //     arguments: [
                                //       BillOption.update,
                                //       billData.billId.toString(),
                                //       screenController.companyId.toString(),
                                //       screenController.billComingFrom,
                                //     ],
                                //     transition: Transition.zoom)!
                                //     .then((value) async {
                                //   screenController.isLoading(true);
                                //   screenController.hasMore = true;
                                //   screenController.pageIndex = 1;
                                //   screenController.billList.clear();
                                //   await screenController.getBillFunction();
                                // });
                              },
                              child: Icon(
                                Icons.edit_sharp,
                                size: 7.w,
                                color: AppColors.appColors,
                              ),
                            ).paddingSymmetric(horizontal: 8),
                            InkWell(
                              onTap: () {
                                CommonbottomSheetModule(
                                  context: context,
                                  icon: Icon(Icons.info_outline,
                                      color: AppColors.greyColor,
                                      size: Get.width * .4),
                                  titleText: AppMessage.areYouSure,
                                  subTitleText:
                                      AppMessage.doYouWantToDeleteThisRecord,
                                  onYesText: AppMessage.yesDeleteIt,
                                  onCancelText: AppMessage.cancel,
                                  onYesTap: () async {
                                    Get.back();
                                    await preQualificationCheckListScreenController.deletePreQualificationCheckListFunction(
                                      preQualificationId: preQualificationList.preQualificationCheckListId.toString(),
                                      index: i,
                                    );
                                  },
                                  onCancelTap: () =>
                                      Navigator.of(context).pop(false),
                                );
                              },
                              child: Icon(
                                Icons.delete,
                                size: 7.w,
                                color: AppColors.redColor,
                              ),
                            ).paddingSymmetric(horizontal: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).paddingSymmetric(vertical: 5);
              } else {
                return preQualificationCheckListScreenController.hasMore
                    ? Center(child: CommonLoader().showLoader())
                    : Container();
              }
            },
          );
  }
}
