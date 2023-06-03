import 'package:crm_project/constants/extension.dart';
import 'package:crm_project/screens/attachment_screen/attachment_list_screen.dart';
import 'package:crm_project/screens/bill_screens/bill_list_screen/bill_list_screen.dart';
import 'package:crm_project/screens/contact_screens/contact_manage_screen/contact_manage_screen.dart';
import 'package:crm_project/screens/contact_screens/pre_qualification_checklist_screen/pre_qualification_checklist_list_screen/pre_qualification_checklist_list_screen.dart';
import 'package:crm_project/screens/invoice_screen/invoice_list_screen.dart';
import 'package:crm_project/screens/ledger_screens/ledger_list_screen/ledger_list_screen.dart';
import 'package:crm_project/screens/notes_screens/notes_list_screen/notes_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/common_listtile_module.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../controller/company_module_controllers/contact_module_controller/edit_contact_option_screen_controller.dart';
import '../../utils/enums.dart';
import '../../utils/messaging.dart';

class ContactOptionsScreen extends StatelessWidget {
  ContactOptionsScreen({Key? key}) : super(key: key);
  final contactOptionController = Get.put(ContactOptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Edit contact',
        leadingShow: false,
        actionShow: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Contact Details Module
              CommonListTitleModule(
                icon: Icon(Icons.home, size: 20.sp),
                titleText: AppMessage.details,
                ontap: () => Get.to(
                  () => ContactManageScreen(),
                  arguments: [
                    ContactOption.update,
                    contactOptionController.companyId,
                    contactOptionController.contactId,
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Notes Module
              CommonListTitleModule(
                icon: Icon(Icons.notes, size: 20.sp),
                titleText: AppMessage.notes,
                ontap: () {
                  Get.to(
                    () => NotesListScreen(),
                    arguments: [
                      // "",
                      contactOptionController.contactId,
                      NotesComingFrom.contact,
                    ],
                  );
                },
              ),

              const SizedBox(height: 10),
              // Related Contacts Module
              CommonListTitleModule(
                icon: Icon(Icons.contacts, size: 20.sp),
                titleText: AppMessage.relatedContacts,
                ontap: () {},
              ),
              const SizedBox(height: 10),
              // Related Contacts Module
              CommonListTitleModule(
                icon: Icon(Icons.home, size: 20.sp),
                titleText: AppMessage.tenantInfo,
                ontap: () {},
              ),

              const SizedBox(height: 10),
              // tenantEmployment Module
              CommonListTitleModule(
                icon: Icon(Icons.notes_outlined, size: 20.sp),
                titleText: AppMessage.tenantEmployment,
                ontap: () {},
              ),

              const SizedBox(height: 10),
              // tenantFinance Module
              CommonListTitleModule(
                icon: Icon(Icons.speaker_notes_off, size: 20.sp),
                titleText: AppMessage.tenantFinance,
                ontap: () {},
              ),
              const SizedBox(height: 10),

              // attachments Module
              CommonListTitleModule(
                icon: Icon(Icons.attachment, size: 20.sp),
                titleText: AppMessage.attachments,
                ontap: () {
                  Get.to(() => AttachmentListScreen(), arguments: [
                    contactOptionController.contactId,
                    AttachmentComingFrom.contact,
                  ]);
                },
              ),
              const SizedBox(height: 10),
              // lease Module
              CommonListTitleModule(
                icon: Icon(Icons.new_releases, size: 20.sp),
                titleText: AppMessage.leaseLabel,
                ontap: () {},
              ),

              const SizedBox(height: 10),
              // activities Module
              CommonListTitleModule(
                icon: Icon(Icons.local_activity, size: 20.sp),
                titleText: AppMessage.activities,
                ontap: () {},
              ),

              const SizedBox(height: 10),
              // lease Module
              CommonListTitleModule(
                icon: Icon(Icons.home, size: 20.sp),
                titleText: AppMessage.preQualificationChecklist,
                ontap: () {
                  Get.to(
                    () => PreQualificationListScreen(),
                    arguments: contactOptionController.contactId,
                  );
                },
              ),

              const SizedBox(height: 10),
              // lease Module
              CommonListTitleModule(
                icon: Icon(Icons.legend_toggle, size: 20.sp),
                titleText: AppMessage.ledger,
                ontap: () {
                  Get.to(() => LedgerListScreen(), arguments: [
                    contactOptionController.companyId,
                    LedgerComingFrom.contact,
                    contactOptionController.contactId,
                  ]);
                },
              ),

              const SizedBox(height: 10),
              // bill Module
              CommonListTitleModule(
                icon: Icon(Icons.home, size: 20.sp),
                titleText: AppMessage.bill,
                ontap: () {
                  Get.to(() => BillListScreen(), arguments: [
                    contactOptionController.companyId,
                    BillComingFrom.contact,
                    contactOptionController.contactId,
                  ]);
                },
              ),

              const SizedBox(height: 10),
              // invoice Module
              CommonListTitleModule(
                icon: Icon(Icons.home, size: 20.sp),
                titleText: AppMessage.invoice,
                ontap: () {
                  Get.to(
                    () => InvoiceListScreen(),
                    arguments: [
                      contactOptionController.companyId,
                      InvoiceComingFrom.contact,
                      contactOptionController.contactId,
                    ],
                  );
                },
              ),

              const SizedBox(height: 10),
              // property Module
              CommonListTitleModule(
                icon: Icon(Icons.home, size: 20.sp),
                titleText: AppMessage.property,
                ontap: () {},
              ),

              const SizedBox(height: 10),
              // email Module
              CommonListTitleModule(
                icon: Icon(Icons.email, size: 20.sp),
                titleText: AppMessage.email,
                ontap: () {},
              ),
            ],
          ).commonAllSidePadding(10),
        ),
      ),
    );
  }
}
