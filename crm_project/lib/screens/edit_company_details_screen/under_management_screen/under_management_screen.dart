import 'package:crm_project/common_modules/text_row.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/under_management_screen_controller.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_textfield.dart';
import '../../../common_modules/divider.dart';
import '../../../constants/colors.dart';

class UnderManagementScreen extends StatelessWidget {
  UnderManagementScreen({Key? key}) : super(key: key);
  final underManagementScreenController =
      Get.put(UnderManagementScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: AppMessage.underManagement, leadingShow: false, actionShow: false),
      body: Column(
        children: [
          TextFieldModule(
          fieldController: underManagementScreenController.searchTextFieldController,
          hintText: 'Search...',
          onChange: (text) {
            // log(text.toString());
          },
          backgroundColor: AppColors.whiteColor,
          icon: GestureDetector(
              onTap: () {
                // log('Search... ${companyListScreenController.searchTextFieldController.text}');
              },
              child: const Icon(Icons.search).paddingOnly(left: 5, right: 5)),
          keyboardType: TextInputType.text).paddingOnly(bottom: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AppMessage.underManagementList,
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
                  border: Border.all(
                    color: AppColors.appColors,
                    width: 1,
                  ),
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
              )
            ],
          ).paddingOnly(top: 8),
          const CustomDivider(),
          Container(
            decoration: BoxDecoration(
                color: AppColors.appColors.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: AppColors.appColors.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('notesList Screen',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor)),
                      Text(AppMessage.propertyName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey700Color)),
                    ],
                  ).paddingOnly(left: 10, right: 10, top: 10, bottom: 10),
                ),
                Column(
                  children: [
                    TextRow(
                        title: 'Address',
                        subTitle: '77- vrijmn bid vn, neare jnikn jk, ndfvjn ',//'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                        subTitleColor: AppColors.blackColor,
                        titleColor: AppColors.blackColor.withOpacity(0.6)),
                    const SizedBox(height: 10,),
                    TextRow(
                        title: 'Start Date',
                        subTitle: '15-10-2023',//'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                        subTitleColor: AppColors.blackColor,
                        titleColor: AppColors.blackColor.withOpacity(0.5)),
                    const SizedBox(height: 5,),
                    TextRow(
                        title: 'End Date',
                        subTitle: '15-10-2023',//'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                        subTitleColor: AppColors.blackColor,
                        titleColor: AppColors.blackColor.withOpacity(0.5)),
                    const SizedBox(height: 5,),
                    TextRow(
                        title: 'Renewal Type',
                        subTitle: '',//'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                        subTitleColor: AppColors.blackColor,
                        titleColor: AppColors.blackColor.withOpacity(0.5)),
                  ],
                ).paddingOnly(left: 10, right: 10, top: 10, bottom: 10),
              ],
            ),
          ).paddingOnly(bottom: 5)
        ],
      ).paddingOnly(left: 15, top: 20, right: 15),
    );
  }
}
