import 'dart:developer';

import 'package:crm_project/common_modules/common_bottomsheet_module.dart';
import 'package:crm_project/controller/company_list_screen_controller.dart';
import 'package:crm_project/screens/edit_company_details_screen/edit_company_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/common_textfield.dart';

// import '../../common_modules/divider.dart';
import '../../constants/colors.dart';
import '../../utils/messaging.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({Key? key}) : super(key: key);
  final companyListScreenController = Get.find<CompanyListScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
        fieldController: companyListScreenController.searchTextFieldController,
        hintText: 'Search...',
        onChange: (text) {
          log(text.toString());
        },
        backgroundColor: AppColors.whiteColor,
        icon: GestureDetector(
            onTap: () {
              log('Search... ${companyListScreenController.searchTextFieldController.text}');
            },
            child: const Icon(Icons.search).paddingOnly(left: 5, right: 5)),
        keyboardType: TextInputType.text);
  }
}

//CompanyList
class CompanyListWidget extends StatelessWidget {
  CompanyListWidget({Key? key}) : super(key: key);
  final companyListScreenController = Get.find<CompanyListScreenController>();

  @override
  Widget build(BuildContext context) {
    return companyListScreenController.companyList.isEmpty
        ? const Center(
            child: Text("No data"),
          )
        : ListView.builder(
            itemCount: companyListScreenController.companyList.length + 1,
            controller: companyListScreenController.scrollController,
            itemBuilder: (context, i) {
              if (i < companyListScreenController.companyList.length) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.appColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(2.w)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width,
                          decoration: BoxDecoration(
                            // color: AppColors.appColors.withOpacity(0.1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2.w),
                              topRight: Radius.circular(2.w),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                companyListScreenController
                                    .companyList[i].companyName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              Text(
                                '${AppMessage.type}: ${companyListScreenController.companyList[i].companyType.companyTypes}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  color: AppColors.blackColor
                                      .withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(Icons.call, size: 6.w),
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    child: Text(
                                        companyListScreenController
                                            .companyList[i].phone,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 13.sp)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.browse_gallery_rounded,
                                    size: 6.w,
                                  ),
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    child: Text(
                                        companyListScreenController
                                            .companyList[i].website,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 13.sp)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                            ],
                          ).paddingOnly(
                              left: 10, right: 10, top: 10, bottom: 0)),

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
                                    value:companyListScreenController
                                        .companyList[i].isActive,
                                    onChanged: (value) async {
                                      await companyListScreenController
                                          .changeCompanyStatusFunction(
                                          companyId:
                                          companyListScreenController
                                              .companyList[i]
                                              .companyId,
                                          status: value,
                                          index: i);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(
                                        () =>
                                        EditCompanyDetailsScreen(),
                                    arguments: [
                                      companyListScreenController
                                          .companyList[i]
                                          .companyName,
                                      companyListScreenController
                                          .companyList[i].companyId,
                                    ])!
                                    .then(
                                      (value) async {
                                    companyListScreenController
                                        .companyList
                                        .clear();
                                    companyListScreenController
                                        .pageIndex = 1;
                                    companyListScreenController
                                        .hasMore = true;
                                    await companyListScreenController
                                        .getCompanyListFunction();
                                  },
                                );
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
                                  subTitleText: AppMessage
                                      .doYouWantToDeleteThisRecord,
                                  onYesText: AppMessage.yesDeleteIt,
                                  onCancelText: AppMessage.cancel,
                                  onYesTap: () =>
                                      companyListScreenController
                                          .deleteCompanyFunction(
                                          context: context,
                                          companyId:
                                          companyListScreenController
                                              .companyList[
                                          i]
                                              .companyId,
                                          index: i),
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
                            ).paddingSymmetric(horizontal: 8),
                          ],
                        ),
                      )
                    ],
                  ),
                ).paddingOnly(bottom: 5);
              } else {
                return companyListScreenController.hasMore
                    ? const Center(child: CircularProgressIndicator())
                    : const Center(
                        child: Text(
                        "No more companies!",
                      ));
              }
            },
          ).paddingOnly(top: 5);
  }
}
