import 'dart:developer';

import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../constants/api_url.dart';
import '../models/ledger_screen_model/active_company_list_model.dart';
import '../models/ledger_screen_model/active_property_model.dart';
import '../utils/common_functions.dart';
import '../utils/messaging.dart';

class BillManageScreenController extends GetxController {
  BillOption billOption = Get.arguments[0];
  String billId = Get.arguments[1];
  String companyId = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  RxString appBarHeader = "".obs;

  final dioRequest = dio.Dio();

  List<CompanyData> companyList = [];
  CompanyData companyDataValue = CompanyData();

  List<PropertyData> propertyList = [];
  PropertyData propertyDataValue = PropertyData();

  DateTime date = DateTime.now();
  RxString showDate = "".obs;

  DateTime dueDate = DateTime.now();
  RxString showDueDate = "".obs;

  TextEditingController addressFieldController = TextEditingController();
  TextEditingController referenceFieldController = TextEditingController();
  TextEditingController balanceFieldController = TextEditingController();
  TextEditingController totalFieldController = TextEditingController();
  RxBool isPaidValue = false.obs;

  /// Get All Active Company Function
  Future<void> getAllActiveCompanyFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeCompanyGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllActiveCompanyFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Company Response :${jsonEncode(response.data)}');

      ActiveCompanyListModel activeCompanyListModel =
      ActiveCompanyListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeCompanyListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        companyList.clear();
        companyList.addAll(activeCompanyListModel.data);

        for (var element in companyList) {
          if (companyId == element.companyId.toString()) {
            companyDataValue = element;
          }
        }

      } else {
        log('getAllActiveCompanyFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // isLoading(false);
    await getAllActivePropertyFunction();
  }

  /// Get All Active Property Function
  Future<void> getAllActivePropertyFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activePropertyGetAllApi}?customerId=${AppMessage.customerId}";
    log('Get All Active Property Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Property Response :${response.data}');

      ActivePropertyListModel activePropertyListModel =
      ActivePropertyListModel.fromJson(response.data);
      isSuccessStatusCode.value = activePropertyListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        propertyList.clear();
        propertyList.add(PropertyData(propertyName: "Select Property"));
        propertyDataValue = propertyList[0];
        propertyList.addAll(activePropertyListModel.data);
      } else {
        log('getAllActivePropertyFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }
    isLoading(false);
  }


  /// Select Date Module
  Future<void> selectDate({required BuildContext context, required DateTime initialDate, required SelectedDateType selectedDateType}) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      if(selectedDateType == SelectedDateType.date) {
        date = picked;
        showDate.value = DateFormatChanger().dateFormat(date);
      } else if(selectedDateType == SelectedDateType.dueDate) {
        dueDate = picked;
        showDueDate.value = DateFormatChanger().dateFormat(dueDate);
      }

    }
  }


  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    log('billId :$billId');
    bool isCreate = billOption == BillOption.create ? true : false;
    appBarHeader.value =
    isCreate == true ? AppMessage.addBill : AppMessage.billDetails;

    showDate.value = DateFormatChanger().dateFormat(date);
    showDueDate.value = DateFormatChanger().dateFormat(dueDate);

    await getAllActiveCompanyFunction();

    // showSelectedDate.value = DateFormatChanger().dateFormat(selectedDate);

    // await getAllActiveCategoryFunction();
  }

}