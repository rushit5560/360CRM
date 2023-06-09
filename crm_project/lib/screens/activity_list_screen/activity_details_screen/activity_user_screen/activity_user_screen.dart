import 'dart:developer';

import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_modules/common_label_export_module.dart';
import '../../../../common_modules/common_textfield.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/activity_module_controllers/activity_user_screen_controller.dart';
import '../../../../utils/enums.dart';
import 'activity_user_manage_screen/activity_user_manage_screen.dart';
import 'activity_user_screen_widgets.dart';

class ActivityUserScreen extends StatelessWidget {
  ActivityUserScreen({Key? key}) : super(key: key);
  final activityUserScreenController = Get.put(ActivityUserScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: AppMessage.users, leadingShow: false, actionShow: false),
      body: SafeArea(
        child: Obx(
          () => activityUserScreenController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(children: [
//Search Bar
                  TextFieldModule(
                      fieldController: activityUserScreenController
                          .searchTextFieldController,
                      hintText: 'Search...',
                      onChange: (text) {
                        log(text.toString());
                      },
                      backgroundColor: AppColors.whiteColor,
                      icon: GestureDetector(
                          onTap: () {
                            log('Search... ${activityUserScreenController.searchTextFieldController.text}');
                          },
                          child: const Icon(Icons.search)
                              .paddingOnly(left: 5, right: 5)),
                      keyboardType: TextInputType.text),
//Label & Export
                  const SizedBox(height: 10),
                  CommonLabelExportModule(
                      title: AppMessage.usersList, exportStatus: true),

                  Expanded(child: UserListWidgets())
                ]).paddingOnly(left: 10, right: 10, top: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'a',
        onPressed: () {
          Get.to(()=> ActivityUserManageScreen(),arguments: [
            ActivityUserManageOption.create,
            ''
          ] )!.then((value) async{
            activityUserScreenController.userList.clear();
            activityUserScreenController.pageIndex = 1;
            activityUserScreenController.hasMore = true;
            await activityUserScreenController.getUserListFunction();
          });
        },
        backgroundColor: AppColors.appColors,
        child: const Icon(Icons.add),
      ),
    );
  }
}
