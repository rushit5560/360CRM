import 'package:crm_project/controller/company_list_screen_controller.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../constants/colors.dart';
import '../manage_company_details_screen/manage_company_details_screen.dart';
import 'company_list_screen_widgets.dart';

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
            CompanyListWidget(),
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
          // SizedBox(height: 5,),
          // FloatingActionButton(
          //   heroTag: 'ab',
          //   onPressed: () {
          //     // Handle export button press
          //   },
          //   backgroundColor: AppColors.appColors,
          //   child: Icon(Icons.file_download),
          // ),
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
