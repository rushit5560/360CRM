import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/work_order_module_controllers/edit_work_order_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/common_listtile_module.dart';
import '../../../utils/enums.dart';
import '../../../utils/messaging.dart';
import '../../ledger_screens/ledger_list_screen/ledger_list_screen.dart';
import 'details_work_order_screen/details_work_order_screen.dart';
import 'package:crm_project/screens/work_order_screen/edit_work_order_screen/repair_list_screen/repair_list_screen.dart';

class EditWorkOrderOptionsScreen extends StatelessWidget {
  EditWorkOrderOptionsScreen({Key? key}) : super(key: key);
  final editWorkOrderScreenController =
      Get.put(EditWorkOrderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Edit Work Order',
        leadingShow: false,
        actionShow: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Company Details Module
              CommonListTitleModule(
                icon: Icon(Icons.home, size: 20.sp),
                titleText: AppMessage.details,
                ontap: () => Get.to(
                  () => DetailWorkOrderScreen(),
                  arguments: [
                    editWorkOrderScreenController.workOrderID.toString(),
                  ],
                ),
              ),
              CommonListTitleModule(
                icon: Icon(Icons.list, size: 20.sp),
                titleText: AppMessage.repairList,
                ontap: () {
                  Get.to(()=> RepairListScreen(),
                    arguments: [editWorkOrderScreenController.companyId],
                  );
                },
              ),
              CommonListTitleModule(
                icon: Icon(Icons.contacts, size: 20.sp),
                titleText: AppMessage.contacts,
                // ontap: () => Get.to(
                //       () => ManageCompanyDetailsScreen(),
                //   arguments: [
                //     CompanyOption.update,
                //     editCompanyDetailsScreenController.companyName.toString(),
                //     editCompanyDetailsScreenController.companyId.toString(),
                //   ],
                // ),
              ),
              // Ledger Module
              CommonListTitleModule(
                icon: Icon(Icons.currency_exchange, size: 20.sp),
                titleText: AppMessage.ledger,
                ontap: () {
                  Get.to(()=> LedgerListScreen(),
                    arguments: [
                      editWorkOrderScreenController.companyId,
                      LedgerComingFrom.workOrder,
                      "",
                    ],
                  );
                },
                // ontap: () => Get.to(
                //       () => ManageCompanyDetailsScreen(),
                //   arguments: [
                //     CompanyOption.update,
                //     editCompanyDetailsScreenController.companyName.toString(),
                //     editCompanyDetailsScreenController.companyId.toString(),
                //   ],
                // ),
              ),
              CommonListTitleModule(
                icon: Icon(Icons.file_copy, size: 20.sp),
                titleText: AppMessage.bill,
                // ontap: () => Get.to(
                //       () => ManageCompanyDetailsScreen(),
                //   arguments: [
                //     CompanyOption.update,
                //     editCompanyDetailsScreenController.companyName.toString(),
                //     editCompanyDetailsScreenController.companyId.toString(),
                //   ],
                // ),
              ),
              CommonListTitleModule(
                icon: Icon(Icons.featured_play_list_outlined, size: 20.sp),
                titleText: AppMessage.invoice,
                // ontap: () => Get.to(
                //       () => ManageCompanyDetailsScreen(),
                //   arguments: [
                //     CompanyOption.update,
                //     editCompanyDetailsScreenController.companyName.toString(),
                //     editCompanyDetailsScreenController.companyId.toString(),
                //   ],
                // ),
              ),
              CommonListTitleModule(
                icon: Icon(Icons.link, size: 20.sp),
                titleText: AppMessage.attachment,
                // ontap: () => Get.to(
                //       () => ManageCompanyDetailsScreen(),
                //   arguments: [
                //     CompanyOption.update,
                //     editCompanyDetailsScreenController.companyName.toString(),
                //     editCompanyDetailsScreenController.companyId.toString(),
                //   ],
                // ),
              ),
              CommonListTitleModule(
                icon: Icon(Icons.note_alt, size: 20.sp),
                titleText: AppMessage.notes,
                // ontap: () => Get.to(
                //       () => ManageCompanyDetailsScreen(),
                //   arguments: [
                //     CompanyOption.update,
                //     editCompanyDetailsScreenController.companyName.toString(),
                //     editCompanyDetailsScreenController.companyId.toString(),
                //   ],
                // ),
              ),
            ],
          ).paddingAll(10),
        ),
      ),
    );
  }
}
