import 'dart:developer';

import 'package:get/get.dart';

class AddWorkOrderScreenController extends GetxController{
  String companyId = Get.arguments[0].toString();

  @override
  void onInit() {
    log('companyId: $companyId');
    super.onInit();
  }
}