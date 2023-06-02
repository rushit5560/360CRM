import 'dart:developer';
import 'package:crm_project/controller/company_module_controllers/contact_module_controller/pre_qualification_checklist_list_screen_controller.dart';
import 'package:crm_project/screens/contact_screens/pre_qualification_checklist_screen/pre_qualification_checklist_list_screen/pre_qualification_checklist_screen_widgets.dart';
import 'package:crm_project/screens/contact_screens/pre_qualification_checklist_screen/pre_qualification_checklist_manage_screen/pre_qualification_manage_screen_widgets.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_modules/common_loader.dart';
import '../../../../common_modules/common_textfield.dart';
import '../../../../common_modules/divider.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/messaging.dart';

class PreQualificationListScreen extends StatelessWidget {
  PreQualificationListScreen({Key? key}) : super(key: key);
  final preQualificationCheckListScreenController =
      Get.put(PreQualificationCheckListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
        titleText: AppMessage.preQualification,
        leadingShow: false,
        actionShow: false,
      ),
      body: Obx(
        () => preQualificationCheckListScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : Column(
                children: [
                  // Search Field Module
                  TextFieldModule(
                    fieldController: preQualificationCheckListScreenController
                        .searchTextFieldController,
                    hintText: AppMessage.searchFieldText,
                    onChange: (text) {
                      log(text.toString());
                    },
                    backgroundColor: AppColors.whiteColor,
                    icon: GestureDetector(
                      onTap: () {
                        log('Search... ${preQualificationCheckListScreenController.searchTextFieldController.text}');
                      },
                      child: const Icon(Icons.search)
                          .paddingOnly(left: 5, right: 5),
                    ),
                    keyboardType: TextInputType.text,
                  ).paddingOnly(top: 20, bottom: 5),
                  // Heading & Export button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          AppMessage.preQualificationList,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.appColors,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.w),
                          border:
                              Border.all(color: AppColors.appColors, width: 1),
                        ),
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
                      ),
                    ],
                  ).paddingOnly(top: 8),
                  const CustomDivider(),
                  Expanded(
                    child: PreQualificationListWidgets(),
                  ),
                ],
              ).paddingOnly(left: 10, right: 10),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: AppMessage.addLedger,
        onPressed: () {
          Get.to(() => PreQualificationManageScreen(),
              arguments: [
                preQualificationCheckListScreenController.contactId,
                PreQualificationChecklistOption.create,
                // "",
                // billListScreenController.companyId.toString(),
                // billListScreenController.billComingFrom,
              ],
              transition: Transition.zoom);
          // !
          //     .then((value) async {
          //   billListScreenController.isLoading(true);
          //   billListScreenController.hasMore = true;
          //   billListScreenController.pageIndex = 1;
          //   billListScreenController.billList.clear();
          //   await billListScreenController.getBillFunction();
          // });
        },
        backgroundColor: AppColors.appColors,
        child: const Icon(Icons.add),
      ),
    );
  }
}
