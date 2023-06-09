import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_modules/common_textfield_header_module.dart';
import 'package:crm_project/common_modules/text_row.dart';
import 'package:crm_project/utils/common_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_bottomsheet_module.dart';
import '../../constants/colors.dart';
import '../../controller/activity_module_controllers/activity_list_screen_controller.dart';
import '../../utils/enums.dart';
import '../../utils/messaging.dart';
import 'activity_details_screen/activity_details_screen.dart';
import 'manage_activity_screen/activity_manage_screen.dart';

class ActivityListWidget extends StatelessWidget {
  ActivityListWidget({Key? key}) : super(key: key);
  final activityListScreenController = Get.find<ActivityListScreenController>();

  @override
  Widget build(BuildContext context) {
    return activityListScreenController.activityList.isEmpty
        ? const Center(child: Text("No data")) : ListView.builder(
      controller: activityListScreenController.scrollController,
      itemCount: activityListScreenController.activityList.length + 1,
      itemBuilder: (context, index) {
        if (activityListScreenController.activityList.length > index) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.appColors.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      // color: AppColors.appColors.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activityListScreenController
                              .activityList[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text('Type: ${activityListScreenController.activityList[index].activityType.type}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp,
                            color: AppColors.blackColor.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextRow(
                            title: AppMessage.startDate,
                            subTitle: DateFormatChanger().dateFormat(
                                activityListScreenController
                                    .activityList[index].startDate),
                            subTitleColor: AppColors.grey700Color),
                        const SizedBox(height: 5),
                        TextRow(
                            title: AppMessage.dueDate,
                            subTitle: DateFormatChanger().dateFormat(
                                activityListScreenController
                                    .activityList[index].dueDate),
                            subTitleColor: AppColors.grey700Color),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ).paddingOnly(left: 10, right: 10, top: 10, bottom: 0)),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.appColors.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Transform.scale(
                            alignment: AlignmentDirectional.centerEnd,
                            scale: 0.8,
                            child: CupertinoSwitch(
                              activeColor: AppColors.appColors,
                              trackColor: AppColors.appColorsSecondry,
                              value: activityListScreenController
                                  .activityList[index].isActive,
                              onChanged: (value) async {
                                await activityListScreenController
                                    .activityStatusChangeFunction(
                                        activityId: activityListScreenController
                                            .activityList[index].activityId,
                                        status: value,
                                        index: index);
                              },
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(()=> ActivityDetailsScreen(),arguments: [
                            ActivityOption.update,
                            activityListScreenController.activityList[index].activityId.toString(),
                            activityListScreenController.activityList[index].title.toString()
                          ] )!.then((value) async{
                            activityListScreenController.activityList.clear();
                            activityListScreenController.pageIndex = 1;
                            activityListScreenController.hasMore = true;
                            await activityListScreenController.getActivityListFunction();
                          });
                        },
                        child: Icon(
                          Icons.edit_sharp,
                          size: 7.w,
                          color: AppColors.appColors,
                        ),
                      ).paddingSymmetric(horizontal: 8),
                      InkWell(
                        onTap: () {
                          CommonbottomSheetModule(
                              context: context,
                              icon: Icon(Icons.info_outline,
                                  color: AppColors.greyColor,
                                  size: Get.width * .4),
                              titleText: AppMessage.areYouSure,
                              subTitleText:
                                  AppMessage.doYouWantToDeleteThisRecord,
                              onYesText: AppMessage.yesDeleteIt,
                              onCancelText: AppMessage.cancel,
                              onYesTap: () => activityListScreenController
                                  .activityDeleteFunction(
                                      activityId: activityListScreenController
                                          .activityList[index].activityId,
                                      index: index),

                              onCancelTap: () =>
                                  Get.back(),
                              );
                        },
                        child: Icon(
                          Icons.delete,
                          size: 7.w,
                          color: AppColors.redColor,
                        ),
                      ).paddingSymmetric(horizontal: 8),
                    ],
                  ),
                )
              ],
            ),
          ).paddingOnly(bottom: 5);
        } else {
          return activityListScreenController.hasMore
              ? CommonLoader().showLoader()
              : const Center(child: Text("No more activity's!"));
        }
      },
    );
  }
}
