import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_modules/common_bottomsheet_module.dart';
import '../../../../common_widgets/header_and_content_module.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/ledger_list_screen_controller.dart';
import '../../../../models/ledger_screen_model/ledger_list_model.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/messaging.dart';
import '../../../common_modules/common_loader.dart';
import '../ledger_manage_screen/ledger_manage_screen.dart';

class LedgerListWidget extends StatelessWidget {
  LedgerListWidget({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerListScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.ledgerList.isEmpty
        ? Center(child: Text(AppMessage.noData))
        : ListView.builder(
            itemCount: screenController.ledgerList.length + 1,
            itemBuilder: (context, i) {

              if (i < screenController.ledgerList.length) {
                LedgerData singleItem = screenController.ledgerList[i];
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.appColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          // Display name Module
                          HeaderAndContentModule(
                            headerText: AppMessage.amountLabel,
                            contentText: singleItem.amount.toString(),
                          ),

                          // Date Module
                          HeaderAndContentModule(
                            headerText: AppMessage.dateLabel,
                            contentText: DateFormatChanger()
                                .dateFormat(singleItem.ledgerDate),
                          ),

                          // Type Module
                          HeaderAndContentModule(
                            headerText: AppMessage.typeLabel,
                            contentText: singleItem.ledgerType,
                          ),

                          // Category Module
                          HeaderAndContentModule(
                            headerText: AppMessage.categoryLabel,
                            contentText: singleItem.accountCategory.category,
                          ),

                          // Reference Module
                          HeaderAndContentModule(
                            headerText: AppMessage.referenceLabel,
                            contentText: singleItem.reference,
                          ),

                          // Details Module
                          HeaderAndContentModule(
                            headerText: AppMessage.detailsLabel,
                            contentText: singleItem.details,
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
                                    value: singleItem.isActive,
                                    onChanged: (value) async {
                                      await screenController
                                          .changeLedgerStatusFunction(
                                        ledgerId:
                                        singleItem.accountLedgerId.toString(),
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
                                Get.to(() => LedgerManageScreen(),
                                    arguments: [
                                      LedgerOption.update,
                                      singleItem.accountLedgerId.toString(),
                                      screenController.companyId.toString(),
                                    ],
                                    transition: Transition.zoom)!.then((value) async {
                                  screenController.isLoading(true);
                                  screenController.hasMore = true;
                                  screenController.pageIndex = 1;
                                  screenController.ledgerList.clear();
                                  await screenController.getLedgersFunction();
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
                                    await screenController.deleteLedgerFunction(
                                      ledgerId:
                                      singleItem.accountLedgerId.toString(),
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
