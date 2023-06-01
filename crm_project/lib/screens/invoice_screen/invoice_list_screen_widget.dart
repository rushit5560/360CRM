import 'dart:developer';

import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/screens/invoice_screen/manage_invoice_screen/invoice_manage_screen.dart';
import 'package:crm_project/utils/common_functions.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_bottomsheet_module.dart';
import '../../common_modules/text_row.dart';
import '../../constants/colors.dart';
import '../../controller/company_module_controllers/invoice_list_screen_controller.dart';
import '../../utils/messaging.dart';

class InvoiceListWidget extends StatelessWidget {
  InvoiceListWidget({Key? key}) : super(key: key);
  final invoiceListScreenController = Get.find<InvoiceListScreenController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: invoiceListScreenController.invoiceList.isEmpty? Center(child: Text('No Data'),):ListView.builder(
          itemCount: invoiceListScreenController.invoiceList.length + 1,
          controller: invoiceListScreenController.scrollController,
          itemBuilder: (context, index) {
            if (index < invoiceListScreenController.invoiceList.length) {
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
                            title: AppMessage.date,
                            subTitle: DateFormatChanger().dateFormat(invoiceListScreenController.invoiceList[index].invoiceDate),
                            subTitleColor: AppColors.blackColor,
                            titleColor: AppColors.blackColor.withOpacity(0.5)),
                        const SizedBox(
                          height: 5,
                        ),
                        TextRow(
                            title: AppMessage.dueDate,
                            subTitle:DateFormatChanger().dateFormat(invoiceListScreenController.invoiceList[index].dueDate),
                            subTitleColor: AppColors.blackColor,
                            titleColor: AppColors.blackColor.withOpacity(0.5)),
                        const SizedBox(
                          height: 5,
                        ),
                        TextRow(
                            title: AppMessage.total,
                            subTitle: invoiceListScreenController.invoiceList[index].totalAmount.toString(),
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
                                  value: invoiceListScreenController.invoiceList[index].isActive,
                                  onChanged: (value) async {
                                    await invoiceListScreenController.changeStatusInvoiceFunction(
                                      invoiceId: invoiceListScreenController.invoiceList[index].invoiceId,
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
                              Get.to(() => InvoiceManageScreen(),
                                  arguments: [
                                    InvoiceOption.update,
                                    invoiceListScreenController.invoiceList[index].invoiceId.toString()
                                  ]
                              )!.then((value) async{
                                invoiceListScreenController.isLoading(true);
                                invoiceListScreenController.hasMore = true;
                                invoiceListScreenController.pageIndex = 1;
                                invoiceListScreenController.invoiceList.clear();
                                await invoiceListScreenController.getInvoiceListFunction();
                              });
                              // log('work Order Id : ${workOrderListScreenController.workOrderList[index].workOrderId.toString()}');
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
                                  // Get.back();
                                  await invoiceListScreenController.deleteInvoiceFunction(
                                    invoiceId: invoiceListScreenController.invoiceList[index].invoiceId,
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
            // } else {
            //   return invoiceListScreenController.hasMore
            //       ? const Center(child: CircularProgressIndicator())
            //       : const Center(child: Text('No more work orders!'));
            }
            else{
              return invoiceListScreenController.hasMore ? CommonLoader().showLoader() : const Center(child: Text('No more invoice!'),);
            }
          },
        ));
  }
}
