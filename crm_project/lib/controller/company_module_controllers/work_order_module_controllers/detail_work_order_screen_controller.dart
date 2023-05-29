import 'dart:developer';

import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../utils/common_functions.dart';

class DetailWorkOrderScreenController extends GetxController {
  String workOrderID = Get.arguments[0];
  RxBool isLoading = false.obs;
  WorkOrderDetailsDate selectedDateType = WorkOrderDetailsDate.date;

  final dioRequest = dio.Dio();
  RxInt isSuccessStatusCode = 0.obs;

  //type
  List typeListDropDown = [];
  // WorkOrderListData typeListValue = WorkOrderListData();

  // status
  List statusListDropDown = [];
  // WorkOrderListData statusListValue = WorkOrderListData();

  // property
  List propertyListDropDown = [];
  // WorkOrderListData propertyListValue = WorkOrderListData();

  // Work List DropDown Value
  List companyListDropDown = [];
  // WorkOrderListData companyListValue = WorkOrderListData();

  //Details TextEditingController
  final detailsTextFieldController = TextEditingController();

  //unit TextEditingController
  final unitTextFieldController = TextEditingController();

  //budget TextEditingController
  final budgetTextFieldController = TextEditingController();

  //perDiemBonus TextEditingController
  final perDiemBonusTextFieldController = TextEditingController();
  // percentageOfBudget TextEditingController
  final percentageOfBudgetTextFieldController = TextEditingController();
  //perDiemPenalty TextEditingController
  final perDiemPenaltyTextFieldController = TextEditingController();
  //actualCost TextEditingController
    final actualCostTextFieldController = TextEditingController();
  //projectedCost TextEditingController
  final projectedCostTextFieldController = TextEditingController();
//costOverRuns TextEditingController
  final costOverRunsTextFieldController = TextEditingController();
//specialTerms TextEditingController
  final specialTermsTextFieldController = TextEditingController();

  //Date
  DateTime selectedDate = DateTime.now();
  RxString showSelectedDate = "".obs;

  //project Date
  DateTime selectedProjectStartDate = DateTime.now();
  RxString showSelectedProjectStartDate = "".obs;

  //Due Date
  DateTime selectedDueDate = DateTime.now();
  RxString showSelectedDueDate = "".obs;

  //complete Date
  DateTime selectedCompleteDate = DateTime.now();
  RxString showSelectedCompleteDate = "".obs;

  RxBool workOrderIsActive = true.obs;

  /// Select Date Module
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null /*&& picked != selectedDate*/) {
      if (WorkOrderDetailsDate.date == selectedDateType) {
        selectedDate = picked;
        showSelectedDate.value = DateFormatChanger().dateFormat(selectedDate);
        log('Date Type : ${selectedDateType.name}');
      }
      else if (WorkOrderDetailsDate.projectStartDate == selectedDateType) {
        selectedProjectStartDate = picked;
        showSelectedProjectStartDate.value = DateFormatChanger().dateFormat(selectedProjectStartDate);
        log('Date Type : ${selectedDateType.name}');
      }

      else if (WorkOrderDetailsDate.dueDate == selectedDateType) {
        selectedDueDate = picked;
        showSelectedDueDate.value = DateFormatChanger().dateFormat(selectedDueDate);
        log('Date Type : ${selectedDateType.name}');
      }else if (WorkOrderDetailsDate.completeDate == selectedDateType) {
        selectedCompleteDate = picked;
        showSelectedCompleteDate.value = DateFormatChanger().dateFormat(selectedCompleteDate);
        log('Date Type : ${selectedDateType.name}');
      } else {
        log('Something Went Wrong');
      }
    }
  }
  @override
  void onInit() {
    log('Work Order Id : $workOrderID');
    super.onInit();
  }
}
