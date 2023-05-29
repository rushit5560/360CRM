import 'dart:developer';

import 'package:get/get.dart';

class EditWorkOrderScreenController extends GetxController{
  String workOrderID = Get.arguments[0];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    log('Work Order Id : $workOrderID');
    super.onInit();
  }
}