import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/screens/activity_list_screen/activity_details_screen/activity_user_screen/activity_user_screen.dart';
import 'package:crm_project/screens/activity_list_screen/manage_activity_screen/activity_manage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_listtile_module.dart';
import '../../../constants/colors.dart';
import '../../../controller/activity_module_controllers/activity_details_screen_controller.dart';
import '../../../utils/enums.dart';
import '../../../utils/messaging.dart';

class ActivityDetailsScreen extends StatelessWidget {
  ActivityDetailsScreen({Key? key}) : super(key: key);

  final activityDetailsScreenController =
      Get.put(ActivityDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: "${activityDetailsScreenController.activityName} Details", leadingShow: false, actionShow: false),
      body: SafeArea(
        child: Column(
          children: [
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),
              children: [
//Details
                InkWell(
                  onTap : () => Get.to(
                        () => ActivityManageScreen(),
                    arguments: [
                      ActivityOption.update,
                      activityDetailsScreenController.activityId.toString(),
                      activityDetailsScreenController.activityName.toString()
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.grey200Color,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.home,color: AppColors.appColors,size: Get.width*.1,),
                        Text(AppMessage.details,textAlign: TextAlign.center,maxLines: 2,style: const TextStyle( color:AppColors.appColors),),
                      ],
                    ),
                  ),
                ),

//user
                InkWell(
                  onTap : () => Get.to(
                        () => ActivityUserScreen(),
                    arguments: [
                      ActivityOption.update,
                      activityDetailsScreenController.activityId.toString(),
                      activityDetailsScreenController.activityName.toString()
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.grey200Color,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.supervised_user_circle_outlined,color: AppColors.appColors,size: Get.width*.1,),
                        Text(AppMessage.users,textAlign: TextAlign.center,maxLines: 2,style: const TextStyle( color:AppColors.appColors),),
                      ],
                    ),
                  ),
                ),
//Contact
                InkWell(
                  // onTap : () => Get.to(
                  //       () => ActivityManageScreen(),
                  //   arguments: [
                  //     ActivityOption.update,
                  //     activityDetailsScreenController.activityId.toString(),
                  //     activityDetailsScreenController.activityName.toString()
                  //   ],
                  // ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.grey200Color,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book_outlined,color: AppColors.appColors,size: Get.width*.1,),
                        Text(AppMessage.contact,textAlign: TextAlign.center,maxLines: 2,style: const TextStyle( color:AppColors.appColors),),
                      ],
                    ),
                  ),
                ),
//Company
                InkWell(
                  // onTap : () => Get.to(
                  //       () => ActivityManageScreen(),
                  //   arguments: [
                  //     ActivityOption.update,
                  //     activityDetailsScreenController.activityId.toString(),
                  //     activityDetailsScreenController.activityName.toString()
                  //   ],
                  // ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.grey200Color,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.maps_home_work_outlined,color: AppColors.appColors,size: Get.width*.1,),
                        Text(AppMessage.company,textAlign: TextAlign.center,maxLines: 2,style: const TextStyle( color:AppColors.appColors),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).paddingAll(10),
      ),
    );
  }
}
