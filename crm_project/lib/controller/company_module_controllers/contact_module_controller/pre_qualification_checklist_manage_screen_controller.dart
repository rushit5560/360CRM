import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/api_url.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/enums.dart';
import '../../../utils/messaging.dart';

class PreQualificationChecklistMangeScreenController extends GetxController {
  String contactId = Get.arguments[0];
  PreQualificationChecklistOption preQualificationChecklistOption =
      Get.arguments[1];
  RxBool isLoading = false.obs;
  RxString appTitleText = "".obs;
  RxString appBarHeader = "".obs;
  DateTime date = DateTime.now();
  RxString showDate = "".obs;
  RxBool isPreQualificationOutStatus = false.obs;

  Map<String, RxBool> checkBoxListItems = {
    '2 Most Recent Pay Stubs' : false.obs,
    'Last 2 years Tax Return' : false.obs,
    '3 Most Recent Months Bank Statement' : false.obs,
    'Copy of Current Drivers License' : false.obs,
    'Credit Application' : false.obs,
    'Original Signature' : false.obs,
    'Paid Application Fee' : false.obs,
  };
  Future<void> addPreQualificationCheckListFunction() async {
    isLoading(true);
    String url = ApiUrl.preQualificationAddApi;
    log("addPreQualificationCheckListFunction api url: $url");
    try {} catch (e) {
      log("addPreQualificationCheckListFunction error: $e");
    }
    isLoading(false);
  }

  /// Select Date Module
  Future<void> selectDate({
    required BuildContext context,
    required DateTime initialDate,
  }) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      // if (selectedDateType == SelectedDateType.date) {
      date = picked;
      showDate.value = DateFormatChanger().dateFormat(date);
      // }
      // else if(selectedDateType == SelectedDateType.dueDate) {
      //   dueDate = picked;
      //   showDueDate.value = DateFormatChanger().dateFormat(dueDate);
      // }
    }
  }

  Future<void> initMethod() async {
    bool isCreate = preQualificationChecklistOption ==
            PreQualificationChecklistOption.create
        ? true
        : false;
    appTitleText.value = isCreate == true ? AppMessage.add : AppMessage.update;
    appBarHeader.value =
        isCreate == true ? AppMessage.addContact : AppMessage.contactDetails;

    showDate.value = DateFormatChanger().dateFormat(date);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
