import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_loader.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/ledger_list_screen_controller.dart';

class LedgerListWidget extends StatelessWidget {
  LedgerListWidget({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerListScreenController>();

  @override
  Widget build(BuildContext context) {
    return /*screenController.ledgerList.isEmpty
    ? const Center(child: Text('No Data'))
    :*/
        ListView.builder(
      itemCount: 2/*screenController.ledgerList.length*/,
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
              color: AppColors.appColors.withOpacity(0.1),
              borderRadius: BorderRadius.circular(2.w)),
          child: Column(
            children: [
              // Edit & Delete Button Module
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                      // CommonbottomSheetModule(
                      //   context: context,
                      //   icon: Icon(Icons.info_outline,color: AppColors.greyColor,size: Get.width*.4),
                      //   titleText: AppMessage.areYouSure,
                      //   subTitleText:AppMessage.doYouWantToDeleteThisRecord,
                      //   onYesText: AppMessage.yesDeleteIt,
                      //   onCancelText: AppMessage.cancel,
                      //   onYesTap: () => null,
                      //   onCancelTap: () => Navigator.of(context).pop(false),
                      // );

                    },
                    child: Icon(
                      Icons.delete,
                      size: 7.w,
                      color: AppColors.redColor,
                    ),
                  ).paddingSymmetric(horizontal: 8),
                ],
              ),

              // Display name Module
              Row(
                children: [
                  Expanded(
                    child: Text(
                        'First Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp,
                            color:
                            AppColors.blackColor.withOpacity(0.6))
                    ),
                  ),
                  Expanded(
                    child: Text(
                        "First Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp,
                            color:
                            AppColors.blackColor.withOpacity(0.6))
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 8, vertical: 8),
        ).paddingSymmetric(vertical: 5);
        /*if (i < screenController.ledgerList.length) {

        } else {
          return screenController.hasMore
              ? Center(child: CommonLoader().showLoader())
              : Container();
        }*/
      },
    );
  }
}
