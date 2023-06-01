import 'dart:developer';

import 'package:get/get.dart';

class EditWorkOrderScreenController extends GetxController{
  String companyId = Get.arguments[0];
  String workOrderID = Get.arguments[1];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    log('Work Order Id : $workOrderID');
    super.onInit();
  }
}