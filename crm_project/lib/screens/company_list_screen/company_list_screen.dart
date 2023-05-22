import 'package:crm_project/controller/company_list_screen_controller.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/divider.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../constants/colors.dart';
import 'company_list_screen_widgets.dart';
import 'manage_company_details_screen/manage_company_details_screen.dart';

class CompanyListScreen extends StatelessWidget {
  CompanyListScreen({Key? key}) : super(key: key);
  final companyListScreenController = Get.put(CompanyListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
          titleText: AppMessage.companyList,
          leadingShow: false,
          actionShow: false),
      body: SafeArea(
        child: Column(
          children: [
            SearchBarWidget().paddingOnly(top: 20, bottom: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppMessage.companyList,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.appColors,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.w),
                      border: Border.all(color: AppColors.appColors, width: 1)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_download,
                        size: 4.w,
                        color: AppColors.appColors,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppMessage.export,
                        style: TextStyle(
                            color: AppColors.appColors,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp),
                      )
                    ],
                  ).paddingAll(4),
                )
              ],
            ).paddingOnly(top: 8),
            const CustomDivider(),
            Expanded(child: CompanyListWidget()),
          ],
        ).paddingOnly(left: 10, right: 10),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'a',
            onPressed: () {
              Get.to(() => ManageCompanyDetailsScreen(),
                  arguments: [
                    CompanyOption.create,
                    'Add Company'],
                  transition: Transition.zoom);
            },
            backgroundColor: AppColors.appColors,
            child: const Icon(Icons.add),
          ),

        ],
      ),

      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     FloatingActionButton.extended(
      //       onPressed: () {
      //         // Add button pressed
      //         // Add your logic here
      //       },
      //       backgroundColor: AppColors.appColors,
      //       label: Text('Add'),
      //       icon: Icon(Icons.add),
      //     ),
      //     SizedBox(height: 10,),
      //     FloatingActionButton.extended(
      //       onPressed: () {
      //         // Export button pressed
      //         // Add your logic here
      //       },
      //       backgroundColor: AppColors.appColors,
      //       label: Text('Export'),
      //       icon: Icon(Icons.file_download),
      //     ),
      //   ],
      // ),
    );
  }
}
