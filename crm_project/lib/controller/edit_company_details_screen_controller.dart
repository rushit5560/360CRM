import 'dart:developer';

import 'package:get/get.dart';

class EditCompanyDetailsScreenController extends GetxController{
  String companyName = Get.arguments[0].toString();
  String companyId = Get.arguments[1].toString();

  @override
  void onInit() {
    log('Company Id: $companyId');
    super.onInit();
  }
}