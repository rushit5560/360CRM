import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LedgerListScreenController extends GetxController {
  String companyId = Get.arguments[0];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  TextEditingController searchTextFieldController = TextEditingController();
  List ledgerList = [];
  bool hasMore = true;
}