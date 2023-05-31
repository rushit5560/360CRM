import 'dart:developer';

import 'package:get/get.dart';

class InvoiceListScreenController extends GetxController{
  String companyId =  Get.arguments[0];


  @override
  void onInit() {
    log('Company Id : $companyId');
    super.onInit();
  }
}