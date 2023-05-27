import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_bottomsheet_module.dart';
import '../../../common_modules/text_row.dart';
import '../../../constants/colors.dart';
import '../../../controller/company_module_controllers/work_order_list_screen_controller.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/messaging.dart';

class WorkOrderListWidget extends StatelessWidget {
  WorkOrderListWidget({Key? key}) : super(key: key);
  final workOrderListScreenController =
      Get.find<WorkOrderListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: workOrderListScreenController.workOrderList.isEmpty? Center(child: Text('No Data'),):ListView.builder(
      itemCount: workOrderListScreenController.workOrderList.length + 1,
      controller: workOrderListScreenController.scrollController,
      itemBuilder: (context, index) {
        if (index < workOrderListScreenController.workOrderList.length) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.appColors.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    TextRow(
                        title: 'Work Order Type',
                        subTitle: workOrderListScreenController
                            .workOrderList[index].workOrderStatus.name!,
                        //'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                        subTitleColor: AppColors.blackColor,
                        titleColor: AppColors.blackColor.withOpacity(0.5)),
                    const SizedBox(
                      height: 5,
                    ),
                    TextRow(
                        title: 'Project Start Date',
                        subTitle: DateFormatChanger().dateFormat(workOrderListScreenController.workOrderList[index].projectDueDate),
                        subTitleColor: AppColors.blackColor,
                        titleColor: AppColors.blackColor.withOpacity(0.5)),
                    const SizedBox(
                      height: 5,
                    ),
                    TextRow(
                        title: 'Project Due Date',
                        subTitle: DateFormatChanger().dateFormat(workOrderListScreenController.workOrderList[index].projectStartDate),
                        subTitleColor: AppColors.blackColor,
                        titleColor: AppColors.blackColor.withOpacity(0.5)),
                    const SizedBox(
                      height: 5,
                    ),
                    TextRow(
                        title: 'Work Order Detail',
                        subTitle: workOrderListScreenController
                            .workOrderList[index].workOrderDetails,
                        //'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                        subTitleColor: AppColors.blackColor,
                        titleColor: AppColors.blackColor.withOpacity(0.6)),
                  ],
                ).paddingOnly(left: 10, right: 10, top: 10, bottom: 10),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.appColors.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Transform.scale(
                            alignment: AlignmentDirectional.centerEnd,
                            scale: 0.8,
                            child: CupertinoSwitch(
                              activeColor: AppColors.appColors,
                              trackColor: AppColors.appColorsSecondry,
                              value: workOrderListScreenController.workOrderList[index].isActive, //singleItem.isActive,
                              onChanged: (value) async {
                                await workOrderListScreenController.changeWorkOrderStatusFunction(
                                  workOrderID: workOrderListScreenController.workOrderList[index].workOrderId.toString(),
                                  status: value,
                                  index: index,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(() => EditCompanyDetailsScreen(),
                          //     arguments: [
                          //       companyListScreenController.companyList[i].companyName,
                          //       companyListScreenController.companyList[i].companyId,
                          //
                          //     ]);
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
                              await workOrderListScreenController.deleteWorkOrderFunction(
                                workOrderId: workOrderListScreenController.workOrderList[index].workOrderId.toString(),
                                index: index,
                              );
                            },
                            onCancelTap: () => Navigator.of(context).pop(false),
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
                )
              ],
            ),
          ).paddingOnly(bottom: 5);
        } else {
          return workOrderListScreenController.hasMore
              ? const Center(child: CircularProgressIndicator())
              : const Center(child: Text('No more attachments!'));
        }
      },
    ));
  }
}
