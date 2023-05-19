import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/edit_company_details_screen_controller.dart';
import 'package:crm_project/screens/edit_company_details_screen/address_screen/address_screen.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_listtile_module.dart';
import '../../utils/messaging.dart';
import '../company_list_screen/manage_company_details_screen/manage_company_details_screen.dart';


class EditCompanyDetailsScreen extends StatelessWidget {
  final editCompanyDetailsScreenController =
      Get.put(EditCompanyDetailsScreenController());

  // String companyName;
  // EditCompanyDetailsScreen({required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            actionShow: false,
            leadingShow: false,
            titleText: editCompanyDetailsScreenController.companyName),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CommonListTitleModule(
                icon: Icon(Icons.home, size: 20.sp),
                titleText: AppMessage.details,
                ontap: () =>  Get.to(() => ManageCompanyDetailsScreen(),
                    arguments: [
                      CompanyOption.update,
                      editCompanyDetailsScreenController.companyName],),
              ),

              CommonListTitleModule(
                icon: Icon(Icons.location_on, size: 20.sp),
                titleText: AppMessage.address,
                ontap: () =>  Get.to(() => AddressScreen(),),
              ),

              CommonListTitleModule(
                icon: Icon(Icons.contact_phone_rounded, size: 20.sp),
                titleText: AppMessage.contact,
              ),
              CommonListTitleModule(
                icon: Icon(Icons.note_alt_sharp, size: 20.sp),
                titleText: AppMessage.notes,
              ),
              CommonListTitleModule(
                icon: Icon(Icons.link, size: 20.sp),
                titleText: AppMessage.attachment,
              ),
              CommonListTitleModule(
                icon: Icon(Icons.manage_history, size: 20.sp),
                titleText: AppMessage.underManagement,
              ),
              CommonListTitleModule(
                icon: Icon(Icons.list_alt_outlined, size: 20.sp),
                titleText: AppMessage.ledger,
              ),
              CommonListTitleModule(
                icon: Icon(Icons.work_outline_sharp, size: 20.sp),
                titleText: AppMessage.workOrder,
              ),
              CommonListTitleModule(
                icon: Icon(Icons.file_copy, size: 20.sp),
                titleText: AppMessage.bill,
              ),
              CommonListTitleModule(
                icon: Icon(Icons.featured_play_list_outlined, size: 20.sp),
                titleText: AppMessage.invoice,
              ),
            ],
          ).paddingAll(10),
        ));
  }
}
