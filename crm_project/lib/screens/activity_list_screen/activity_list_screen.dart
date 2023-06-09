import 'dart:developer';

import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_modules/common_label_export_module.dart';
import '../../common_modules/common_textfield.dart';
import '../../constants/colors.dart';
import '../../controller/activity_module_controllers/activity_list_screen_controller.dart';
import 'activity_list_screen_widget.dart';
import 'manage_activity_screen/activity_manage_screen.dart';

class ActivityListScreen extends StatelessWidget {
  ActivityListScreen({Key? key}) : super(key: key);
  final activityListScreenController = Get.put(ActivityListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: 'Activity List', leadingShow: false, actionShow: false),
      body: SafeArea(
        child: Obx(
          () => activityListScreenController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(children: [
//Search Bar
                  TextFieldModule(
                      fieldController: activityListScreenController
                          .searchTextFieldController,
                      hintText: 'Search...',
                      onChange: (text) {
                        log(text.toString());
                      },
                      backgroundColor: AppColors.whiteColor,
                      icon: GestureDetector(
                          onTap: () {
                            log('Search... ${activityListScreenController.searchTextFieldController.text}');
                          },
                          child: const Icon(Icons.search)
                              .paddingOnly(left: 5, right: 5)),
                      keyboardType: TextInputType.text),
//Label & Export
                  const SizedBox(height: 10),
                  CommonLabelExportModule(
                      title: AppMessage.activityList, exportStatus: true),

                  Expanded(child: ActivityListWidget())
                ]).paddingOnly(left: 10, right: 10, top: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'a',
        onPressed: () {
          Get.to(()=>ActivityManageScreen(),arguments: [
            ActivityOption.create,
            '',
            ''
          ] )!.then((value) async{
            activityListScreenController.activityList.clear();
            activityListScreenController.pageIndex = 1;
            activityListScreenController.hasMore = true;
            await activityListScreenController.getActivityListFunction();
          });
        },
        backgroundColor: AppColors.appColors,
        child: const Icon(Icons.add),
      ),
    );
  }
}
