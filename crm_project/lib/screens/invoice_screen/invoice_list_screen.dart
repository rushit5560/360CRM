import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/invoice_list_screen_controller.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceListScreen extends StatelessWidget {
   InvoiceListScreen({Key? key}) : super(key: key);
   final invoiceListScreenController = Get.put(InvoiceListScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: AppMessage.invoice, leadingShow: false, actionShow: false),
      body: SafeArea(child:Column(
        children: [
          
        ],
      )),
    );
  }
}
