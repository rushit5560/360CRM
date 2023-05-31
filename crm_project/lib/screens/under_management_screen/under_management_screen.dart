import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_modules/text_row.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/under_management_screen_controller.dart';
import 'package:crm_project/screens/under_management_screen/under_management_screen_widget.dart';
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
      body: Obx(
        ()=> underManagementScreenController.isLoading.value ? CommonLoader().showLoader():
            Column(
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
           UnderManagementListWidget(),
          ],
        ).paddingOnly(left: 15, top: 20, right: 15),
      ),
    );
  }
}
