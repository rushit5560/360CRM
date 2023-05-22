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
            onTap: (){
              print('Search... '+ companyListScreenController.searchTextFieldController.text.toString());
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
    return  ListView.builder(
      itemCount: companyListScreenController.companyList.length + 1,
      controller: companyListScreenController.scrollController,
      itemBuilder: (context, i) {

        if(i < companyListScreenController.companyList.length) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.appColors.withOpacity(0.1),
                borderRadius: BorderRadius.circular(2.w)),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      // color: AppColors.appColors.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.w),
                            topRight: Radius.circular(2.w))),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(companyListScreenController.companyList[i].companyName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor)),
                                Text('${AppMessage.type}: ${companyListScreenController.companyList[1].companyType}',
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => EditCompanyDetailsScreen(),
                                          arguments: [
                                            companyListScreenController.companyList[i].companyName,
                                            companyListScreenController.companyList[i].companyId,

                                          ]);
                                    },
                                    child: Icon(
                                      Icons.edit_sharp,
                                      size: 7.w,
                                      color: AppColors.appColors,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      CommonbottomSheetModule(
                                        context: context,
                                        icon: Icon(Icons.info_outline,color: AppColors.greyColor,size: Get.width*.4),
                                        titleText: AppMessage.areYouSure,
                                        subTitleText:AppMessage.doYouWantToDeleteThisRecord,
                                        onYesText: AppMessage.yesDeleteIt,
                                        onCancelText: AppMessage.cancel,
                                        onYesTap: () => null,
                                        onCancelTap: () => Navigator.of(context).pop(false),
                                      );

                                    },
                                    child: Icon(
                                      Icons.delete,
                                      size: 7.w,
                                      color: AppColors.redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).paddingOnly(left: 10, right: 10, top: 10, bottom: 0)),
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Row(
                            children: [
                              Icon(Icons.call, size: 6.w),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: Text( companyListScreenController.companyList[i].phone,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 13.sp)),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(
                                Icons.browse_gallery_rounded,
                                size: 6.w,
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: Text(companyListScreenController.companyList[i].website,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 13.sp)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(
                                  () => Transform.scale(
                                alignment: AlignmentDirectional.centerEnd,
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  activeColor: AppColors.appColors,
                                  trackColor: AppColors.appColorsSecondry,
                                  value: companyListScreenController
                                      .isCompanyStatus.value,
                                  onChanged: (value) =>
                                  companyListScreenController
                                      .isCompanyStatus.value = value,
                                ),
                              ),
                            ),
                            // Obx(
                            //       ()=> Text(companyListScreenController
                            //       .isCompanyStatus.value ? "Active":"inactive",style: TextStyle(color: companyListScreenController
                            //       .isCompanyStatus.value ?AppColors.greenColor:AppColors.redColor,fontSize: 12.sp,fontWeight: FontWeight.bold),),
                            // ),
                          ],
                        ))
                  ],
                ).paddingAll(10),
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
    ).paddingOnly(top: 5, bottom: 10);
  }
}
