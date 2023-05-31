import 'package:crm_project/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/text_row.dart';
import '../../constants/colors.dart';
import '../../controller/company_module_controllers/under_management_screen_controller.dart';
import '../../utils/messaging.dart';

class UnderManagementListWidget extends StatelessWidget {
  UnderManagementListWidget({Key? key}) : super(key: key);
  final underManagementScreenController =
  Get.find<UnderManagementScreenController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(child: underManagementScreenController.underManagementList.isEmpty? Center(child: Text('No Data'),): ListView.builder(
      itemCount: underManagementScreenController.underManagementList.length+1,
      itemBuilder: (context, index) {

        if(index < underManagementScreenController.underManagementList.length){
          return  Container(
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
                   Text(underManagementScreenController.underManagementList[index].propertyName,
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
                     title: AppMessage.address,
                     subTitle: underManagementScreenController.underManagementList[index].address,//'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                     subTitleColor: AppColors.blackColor,
                     titleColor: AppColors.blackColor.withOpacity(0.6)),
                 const SizedBox(height: 10,),
                 TextRow(
                     title: AppMessage.startDate,
                     subTitle: DateFormatChanger().dateFormat(underManagementScreenController.underManagementList[index].startDate),//'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                     subTitleColor: AppColors.blackColor,
                     titleColor: AppColors.blackColor.withOpacity(0.5)),
                 const SizedBox(height: 5,),
                 TextRow(
                     title: AppMessage.endDate,
                     subTitle: DateFormatChanger().dateFormat(underManagementScreenController.underManagementList[index].endDate),//'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                     subTitleColor: AppColors.blackColor,
                     titleColor: AppColors.blackColor.withOpacity(0.5)),
                 const SizedBox(height: 5,),
                 TextRow(
                     title: AppMessage.renewalType,
                     subTitle: underManagementScreenController.underManagementList[index].leaseRenewalTypeId,//'${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                     subTitleColor: AppColors.blackColor,
                     titleColor: AppColors.blackColor.withOpacity(0.5)),
               ],
             ).paddingOnly(left: 10, right: 10, top: 10, bottom: 10),
           ],
         ),
       ).paddingOnly(bottom: 5);
        }
        else{
          return  Center(child: Text(AppMessage.noMoreWorkOrders));
        }
    },));
  }
}
