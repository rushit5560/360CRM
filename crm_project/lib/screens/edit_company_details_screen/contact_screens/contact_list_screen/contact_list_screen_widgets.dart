import 'dart:developer';

import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/controller/company_module_controllers/contact_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_textfield.dart';
import '../../../../constants/colors.dart';

class ContactSearchBarWidget extends StatelessWidget {
  ContactSearchBarWidget({Key? key}) : super(key: key);
  final contactListScreenController = Get.find<ContactListScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
        fieldController: contactListScreenController.searchTextFieldController,
        hintText: 'Search...',
        onChange: (text) {
          log(text.toString());
        },
        backgroundColor: AppColors.whiteColor,
        icon: GestureDetector(
            onTap: (){
              log('Search... ${contactListScreenController.searchTextFieldController.text}');
            },
            child: const Icon(Icons.search).paddingOnly(left: 5, right: 5)),
        keyboardType: TextInputType.text);
  }
}


class ContactListWidget extends StatelessWidget {
  ContactListWidget({Key? key}) : super(key: key);
  final contactListScreenController = Get.find<ContactListScreenController>();

  @override
  Widget build(BuildContext context) {
    return contactListScreenController.contactList.isEmpty
        ? const Center(child: Text('No Data'))
        : ListView.builder(
            itemCount: contactListScreenController.contactList.length + 1,
            itemBuilder: (context, i) {
              if (i < contactListScreenController.contactList.length) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.appColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(2.w)),
                  child: Column(
                    children: [
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
                                contactListScreenController.contactList[i].contact.firstName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                    color:
                                    AppColors.blackColor.withOpacity(0.6))
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                'Last Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                    color:
                                    AppColors.blackColor.withOpacity(0.6))
                            ),
                          ),
                          Expanded(
                            child: Text(
                                contactListScreenController.contactList[i].contact.lastName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                    color:
                                    AppColors.blackColor.withOpacity(0.6))
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                'Role',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                    color:
                                    AppColors.blackColor.withOpacity(0.6))
                            ),
                          ),
                          Expanded(
                            child: Text(
                                contactListScreenController.contactList[i].contact.lastName,
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
                );
              }
              else {
                return contactListScreenController.hasMore
                    ? Center(child: CommonLoader().showLoader())
                    : Container();
              }
            },
          );
  }
}
