import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/edit_company_details_screen_controller.dart';
import 'package:crm_project/screens/invoice_screen/invoice_list_screen.dart';
import 'package:crm_project/screens/ledger_screens/ledger_list_screen/ledger_list_screen.dart';
import 'package:crm_project/screens/under_management_screen/under_management_screen.dart';
import 'package:crm_project/screens/work_order_screen/work_order_list_screen.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_listtile_module.dart';
import '../../utils/messaging.dart';
import '../bill_screens/bill_list_screen/bill_list_screen.dart';
import '../company_list_screen/manage_company_details_screen/manage_company_details_screen.dart';
import 'package:crm_project/screens/attachment_screen/attachment_list_screen.dart';
import 'package:crm_project/screens/address_screen/address_list_screen.dart';

import '../contact_screens/contact_list_screen/contact_list_screen.dart';
import '../notes_screens/notes_list_screen/notes_list_screen.dart';

class EditCompanyDetailsScreen extends StatelessWidget {
  final editCompanyDetailsScreenController =
      Get.put(EditCompanyDetailsScreenController());

  EditCompanyDetailsScreen({super.key});

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
              // Company Details Module
              CommonListTitleModule(
                icon: Icon(Icons.home, size: 20.sp),
                titleText: AppMessage.details,
                ontap: () => Get.to(
                  () => ManageCompanyDetailsScreen(),
                  arguments: [
                    CompanyOption.update,
                    editCompanyDetailsScreenController.companyName.toString(),
                    editCompanyDetailsScreenController.companyId.toString(),
                  ],
                ),
              ),

              // Company Address Module
              CommonListTitleModule(
                icon: Icon(Icons.location_on, size: 20.sp),
                titleText: AppMessage.address,
                ontap: () => Get.to(
                  () => CompanyAddressListScreen(),
                  arguments: [
                    editCompanyDetailsScreenController.companyId.toString()
                  ],
                ),
              ),

              // Company Contact Module
              CommonListTitleModule(
                icon: Icon(Icons.contact_phone_rounded, size: 20.sp),
                titleText: AppMessage.contact,
                ontap: () {
                  Get.to(
                    () => ContactListScreen(),
                    arguments: [
                      editCompanyDetailsScreenController.companyId.toString()
                    ],
                  );
                },
              ),

              // Company Notes Module
              CommonListTitleModule(
                icon: Icon(Icons.note_alt_sharp, size: 20.sp),
                titleText: AppMessage.notes,
                ontap: () {
                  Get.to(
                    () => NotesListScreen(),
                    arguments: [
                      editCompanyDetailsScreenController.companyId.toString()
                    ],
                  );
                },
              ),

              // Company Attachment Module
              CommonListTitleModule(
                icon: Icon(Icons.link, size: 20.sp),
                titleText: AppMessage.attachment,
                ontap: () {
                  Get.to(() => AttachmentListScreen(), arguments: [
                    editCompanyDetailsScreenController.companyId.toString()
                  ]);
                },
              ),

              // Company Under Management Module
              CommonListTitleModule(
                icon: Icon(Icons.manage_history, size: 20.sp),
                titleText: AppMessage.underManagement,
                ontap: () {
                  Get.to(()=>UnderManagementScreen(), arguments: [
                    editCompanyDetailsScreenController.companyId.toString()
                  ]);
                },
              ),

              // Company Ledger Module
              CommonListTitleModule(
                icon: Icon(Icons.list_alt_outlined, size: 20.sp),
                titleText: AppMessage.ledger,
                ontap: () {
                  Get.to(
                    () => LedgerListScreen(),
                    arguments: [
                      editCompanyDetailsScreenController.companyId.toString(),
                      LedgerComingFrom.company,
                    ],
                  );
                },
              ),

              // Company Work Order Module
              CommonListTitleModule(
                icon: Icon(Icons.work_outline_sharp, size: 20.sp),
                titleText: AppMessage.workOrder,
                ontap: () {
                   Get.to(()=> WorkOrderScreen(),arguments: [
                     editCompanyDetailsScreenController.companyId.toString()
                   ]);
                },
              ),

              // Company Bill Module
              CommonListTitleModule(
                icon: Icon(Icons.file_copy, size: 20.sp),
                titleText: AppMessage.bill,
                ontap: () {
                  Get.to(
                    () => BillListScreen(),
                    arguments: [
                      editCompanyDetailsScreenController.companyId.toString()
                    ],
                  );
                },
              ),

              // Company Invoice Module
              CommonListTitleModule(
                icon: Icon(Icons.featured_play_list_outlined, size: 20.sp),
                titleText: AppMessage.invoice,
                ontap: (){
                  Get.to(
                        () => InvoiceListScreen(),
                    arguments: [
                      editCompanyDetailsScreenController.companyId.toString()
                    ],
                  );
                },
              ),
            ],
          ).paddingAll(10),
        ));
  }
}
