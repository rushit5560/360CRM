import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/enums.dart';

class NotesManageScreenController extends GetxController {
  NotesOption notesOption = Get.arguments[0];
  String notesId = Get.arguments[1];

  RxBool isLoading = false.obs;

  TextEditingController notesFieldController = TextEditingController();
  RxBool isStatusSelected = true.obs;

  changeStatusFunction() {
    isStatusSelected.value = !isStatusSelected.value;
    loadUI();
  }

  // Create Notes Function
  Future<void> createNotesFunction() async {
    isLoading(true);
    String url = ApiUrl.companyNotesAddApi;
    log('Create Notes Api Url :$url');

    try {

    } catch(e) {

    }
    isLoading(false);
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}