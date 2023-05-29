import 'package:crm_project/controller/bill_list_screen_controller.dart';
import 'package:crm_project/models/bill_screen_model/bill_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_bottomsheet_module.dart';
import '../../../common_modules/common_loader.dart';
import '../../../common_widgets/header_and_content_module.dart';
import '../../../constants/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/enums.dart';
import '../../../utils/messaging.dart';
import '../bill_manage_screen/bill_manage_screen.dart';

class BillListWidget extends StatelessWidget {
  BillListWidget({Key? key}) : super(key: key);
  final screenController = Get.find<BillListScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.billList.isEmpty
    ? Center(child: Text(AppMessage.noData))
    : ListView.builder(
      itemCount: screenController.billList.length,
      itemBuilder: (context, i) {
        BillData billData = screenController.billList[i];

        if (i < screenController.billList.length) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.appColors.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),

            child: Column(
              children: [

                Column(
                  children: [

                    // Date Module
                    HeaderAndContentModule(
                      headerText: AppMessage.dateLabel,
                      contentText: DateFormatChanger()
                          .dateFormat(billData.billDate),
                    ),

                    // Reference Module
                    HeaderAndContentModule(
                      headerText: AppMessage.referenceLabel,
                      contentText: billData.reference.toString(),
                    ),

                    // Due Date Module
                    HeaderAndContentModule(
                      headerText: AppMessage.dueDateLabel,
                      contentText: DateFormatChanger()
                          .dateFormat(billData.dueDate),
                    ),

                    // Total Module
                    HeaderAndContentModule(
                      headerText: AppMessage.totalLabel,
                      contentText: billData.totalAmount.toString(),
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
                              value: billData.isActive,
                              onChanged: (value) async {
                                await screenController
                                    .changeBillStatusFunction(
                                  billId:
                                  billData.billId.toString(),
                                  status: value,
                                  index: i,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => BillManageScreen(),
                              arguments: [
                                BillOption.update,
                                billData.billId.toString(),
                                screenController.companyId.toString(),
                              ],
                              transition: Transition.zoom)!.then((value) async {
                            screenController.isLoading(true);
                            screenController.hasMore = true;
                            screenController.pageIndex = 1;
                            screenController.billList.clear();
                            await screenController.getBillFunction();
                          });
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
                              await screenController.deleteBillFunction(
                                billId: billData.billId.toString(),
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
          return screenController.hasMore
              ? Center(child: CommonLoader().showLoader())
              : Container();
        }
      },
    );
  }
}
