import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UnderManagementScreenController extends GetxController{
  String companyId = Get.arguments[0].toString();final searchTextFieldController = TextEditingController();
  @override
  void onInit() {
    log("Company Id : $companyId");
    super.onInit();
  }
}