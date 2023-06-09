import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_bottomsheet_module.dart';
import '../../../../common_modules/common_loader.dart';
import '../../../../common_modules/text_row.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/activity_module_controllers/activity_user_screen_controller.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/messaging.dart';
import 'activity_user_manage_screen/activity_user_manage_screen.dart';

class UserListWidgets extends StatelessWidget {
  UserListWidgets({Key? key}) : super(key: key);

  final activityUserScreenController = Get.find<ActivityUserScreenController>();

  @override
  Widget build(BuildContext context) {
    return activityUserScreenController.userList.isEmpty
        ? const Center(child: Text("No data"))
        : ListView.builder(
            controller: activityUserScreenController.scrollController,
            itemCount: activityUserScreenController.userList.length + 1,
            itemBuilder: (context, index) {
              if (activityUserScreenController.userList.length > index) {
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
                              TextRow(
                                  title: "Full Name",
                                  titleColor: AppColors.greyColor,
                                  subTitle: '',
                                  subTitleColor: AppColors.grey700Color),
                              const SizedBox(height: 5),
                              Text(
                                activityUserScreenController
                                    .userList[index].systemUser.fullName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ).paddingOnly(
                              left: 10, right: 10, top: 10, bottom: 0)),
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
                                    value: activityUserScreenController
                                        .userList[index].isActive,
                                    onChanged: (value) async {
                                      await activityUserScreenController
                                          .userChangeStatusFunction(
                                              userId:
                                                  activityUserScreenController
                                                      .userList[index]
                                                      .mtmActivityUserId
                                                      .toString(),
                                              status: value,
                                              index: index);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(()=> ActivityUserManageScreen(),arguments: [
                                  ActivityUserManageOption.update,
                                  activityUserScreenController.userList[index].mtmActivityUserId.toString()
                                ] )!.then((value) async{
                                  activityUserScreenController.userList.clear();
                                  activityUserScreenController.pageIndex = 1;
                                  activityUserScreenController.hasMore = true;
                                  await activityUserScreenController.getUserListFunction();
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
                                  onYesTap: () => activityUserScreenController
                                      .userSoftDeleteFunction(
                                          userId: activityUserScreenController
                                              .userList[index].mtmActivityUserId
                                              .toString(),
                                          index: index),
                                  onCancelTap: () => Get.back(),
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
                return activityUserScreenController.hasMore
                    ? CommonLoader().showLoader()
                    : const Center(child: Text("No more User's!"));
              }
            },
          );
  }
}
